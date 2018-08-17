class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, blog_id: params[:blog_id])
    @favorites = Favorite.where(blog_id: params[:blog_id])
    @blogs = Blog.all
  end

  def destroy
    user = User.find(params[:id])
    @favorites = Favorite.where("user_id = ?", user)
    @favorites.each do |favorite|
    favorite.destroy
    end
  end

  def show
    user = User.find(params[:id])
    @favorites = Favorite.where("user_id = ?", user)
    @blogs = user.blogs.page(params[:page]).per(4).order("created_at DESC")
  end
end
