class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])

    render("users/show.html.erb")
  end

  def new
    @user = User.new

    render("user/new.html.erb")
  end

  def create
    @user = User.new

    @user.photo_id = params[:photo_id]
    @user.body = params[:body]
    @user.user_id = params[:user_id]

    save_status = @user.save

    if save_status == true
      redirect_to("/users/#{@user.id}", :notice => "User created successfully.")
    else
      render("users/new.html.erb")
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    render("comments/edit.html.erb")
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.photo_id = params[:photo_id]
    @comment.body = params[:body]
    @comment.user_id = params[:user_id]

    save_status = @comment.save

    if save_status == true
      redirect_to("/comments/#{@comment.id}", :notice => "Comment updated successfully.")
    else
      render("comments/edit.html.erb")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    if URI(request.referer).path == "/comments/#{@comment.id}"
      redirect_to("/", :notice => "Comment deleted.")
    else
      redirect_to(:back, :notice => "Comment deleted.")
    end
  end
end
