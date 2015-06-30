class BlogPostsController < ApplicationController
  load_and_authorize_resource

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  private

end
