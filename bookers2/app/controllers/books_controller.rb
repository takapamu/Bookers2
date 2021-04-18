class BooksController < ApplicationController

     before_action :authenticate_user!

	def create
      @new_book = Book.new(book_params)
      @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(@new_book.id)
    else
      @user = current_user
      @books = Book.all
      flash[:notice] = ' errors prohibited this obj from being saved:'
      render "index"
    end
	end

  def index
      @user = current_user
      @books = Book.all
      @book = Book.new
  end

  def show
       @book = Book.find(params[:id])
       @new_book = Book.new
       @user = @book.user
  end


  def edit
       @book = Book.find(params[:id])
    if @book.user == current_user
       render action: :edit
    else
       redirect_to books_path
    end
  end

  def update
       @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to  book_path(@book.id)
    else
       @books = Book.all
       flash[:notice]= ' errors prohibited this obj from being saved:'
       render "edit"
    end
  end

  def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
  end


private

  def book_params
        params.require(:book).permit(:title,:body)
  end

  def list
    @new_book = Book.new
  end



end
