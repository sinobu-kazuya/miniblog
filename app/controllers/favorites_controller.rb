class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, blog_id: params[:blog_id])
    @favorites = Favorite.where(blog_id: params[:blog_id])
    @blogss = Blog.all
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, blog_id: params[:blog_id])
    favorite.destroy
    @favorite = Favorite.where(blog_id: params[:blog_id])
    @blogs = Blogs.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
