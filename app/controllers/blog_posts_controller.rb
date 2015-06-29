class BlogPostsController < ApplicationController
  load_and_authorize_resource
  layout 'new'

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  private

end
