class UsersController < ApplicationController

def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to book_path(@book)
end


def index
    @user = current_user
    @books = Book.all
    @book = Book.new
end

def show
   @book = Book.new
    @user = User.find(params[:id])
    @books = @user.book
end

 def edit
    @book = Book.find(params[:id])
 end

  def book_params
        params.require(:book).permit(:title,:body)
  end
end
