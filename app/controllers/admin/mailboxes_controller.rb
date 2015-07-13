class Admin::MailboxesController < Admin::AdminController
  load_and_authorize_resource

  def index
    @mailboxes = Mailbox.all
  end

  def new
    @mailbox = Mailbox.new
  end

  def create
    @mailbox = Mailbox.new(mailbox_params)
    if @mailbox.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @mailbox = Mailbox.find(params[:id])
    if @mailbox.update_attributes(mailbox_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @mailbox = Mailbox.find(params[:id])
  end

  def destroy
    @mailbox = Mailbox.find(params[:id])
    @mailbox.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:mailbox).permit(:username, :domain_id)
  end
end
