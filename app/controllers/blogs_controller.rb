class BlogsController < ApplicationController
  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(text: blog_params[:text],image: blog_params[:image], name: blog_params[:name],user_id: current_user.id)
    @blog.save
  end

  def show
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:image, :text, :name)
  end

end
