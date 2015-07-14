class Admin::UsersController < Admin::AdminController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @organizations = @user.organizations
    @domains = @user.domains
    @mailboxes = Mailbox.where({ domain: @domains })
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.username.blank?
      @user.username = "u_" + Array.new(8){ [*'0'..'9',*'A'..'Z',*'a'..'z'].sample }.join
    end
    if !@user.email.blank?
      @user.slug = @user.username
      @user.invite!(current_user)
      redirect_to admin_users_path
    else
      @user.errors.add(:email, "cannot be blank.")
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :profile_attributes => [:first_name, :last_name, :bio])
  end
end
