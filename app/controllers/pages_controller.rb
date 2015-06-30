class PagesController < ApplicationController
  load_and_authorize_resource
  def index
    @pages = Page.all
  end
  def show
    @page = Page.find(params[:id])
  end
  private
end
