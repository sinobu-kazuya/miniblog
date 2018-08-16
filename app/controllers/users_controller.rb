class UsersController < ApplicationController
  def show
   user = User.find(params[:id])
   @blogs =user.blogs.page(params[:page]).per(4).order("created_at DESC")
  end
end
