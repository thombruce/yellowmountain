class Admin::BlogPostsController < Admin::AdminController
  load_and_authorize_resource

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update_attributes(blog_post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :user_id, :slug_candidate)
  end
end
