class HomeController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end
end
