class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(text: blog_params[:text],image: blog_params[:image], name: blog_params[:name],user_id: current_user.id)
    @blog.save
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end


  def blog_params
    params.require(:blog).permit(:image, :text, :name)
  end

end
