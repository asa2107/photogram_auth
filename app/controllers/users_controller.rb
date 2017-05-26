class UsersController < ApplicationController
  def index
    @users = User.all
    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.all
    render("users/show.html.erb")
  end

  def mylikes
    @likes = Like.all
    @photos = Photo.all
    render("users/mylikes.html.erb")
  end


end
