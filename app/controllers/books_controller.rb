class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end

  # def new
  #   @book=Book.new
  # end

  def create
    book=Book.find(params[:id])
    book.save
    redirect_to book_path(book.id)
  end

  def update
    book=Book.find(params[:id])
    book.update
    redirect_to book_path(book.id)
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def destroy
    book=List.find(params[:id])
    book.destroy
    redirect_to book_path(book.id)
  end

 private
  def book_params
    params.requier(:book).permit(:title, :body)
  end

end