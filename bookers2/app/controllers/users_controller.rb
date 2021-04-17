class UsersController < ApplicationController

   before_action :authenticate_user!, {only: [:edit,:update,:destroy]}


def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to book_path(@book)
end


def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
end

def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
end

 def edit
       @user = User.find(params[:id])
 end

 def update
        @user = User.find(params[:id])
     if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
     else
        flash[:notice] = " errors prohibited this obj from being saved:"
        render :edit

     end
 end

  def book_params
         params.require(:book).permit(:title,:body)
  end
end
