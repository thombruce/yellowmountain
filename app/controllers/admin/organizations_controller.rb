class Admin::OrganizationsController < Admin::AdminController
  load_and_authorize_resource

  def index
    @organizations = Domain.all
  end

  def show
    @organization = Organization.find(params[:id])
    @domains = @organization.domains
    @mailboxes = Mailbox.where({ domain: @domains })
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    @user = @organization.owner
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to root_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name,:user_id)
  end
end