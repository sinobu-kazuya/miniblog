class UsersController < ApplicationController
  def show
   @blogs = Blog.includes(:user, :favorites).page(params[:page]).per(4).order("created_at DESC")
  end
end
