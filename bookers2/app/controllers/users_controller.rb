class UsersController < ApplicationController

   before_action :authenticate_user!


def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @book = Book.new
end

def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
end

 def edit
    @user = User.find(params[:id])
  if @user == current_user
     render "edit"
  else
     redirect_to user_path(current_user)
  end
 end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def book_params
       params.require(:book).permit(:title,:body)
  end
  
  def user_params
       params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
end
