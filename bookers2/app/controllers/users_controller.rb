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
       @user = User.find(params[:id])
    if @book.user == current_user
       render "edit"
    else
      redirect_to books_path
    end
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
