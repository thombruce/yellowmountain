class Admin::PagesController < Admin::AdminController
  load_and_authorize_resource

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to root_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :user_id, :featured_image, :title_color, :slug_candidate)
  end
  # TODO: Should we change 'body' to 'content' for this and all other similar post types? i.e. BlogPost
end
