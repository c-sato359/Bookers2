class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :baria_user, only: [:edit,:update]
  def new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    
    @users = User.all
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "successfully update user!"
    else
      render action: :edit
    end
  end
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
