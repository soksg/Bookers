class BooksController < ApplicationController
  def index
    @books=Book.all
  end

  def new
    @book=Book.new
  end

  def create
    @book=Book.find(params[:id])
    book.save
    redirect_to book_path(book.id)

  def update
    @book=Book.find(params[:id])
    book.update
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
    book.save
    redirect_to book_params

  end

private
  def book_params
    params.requier(:book).permit(:title, :body)
  end
end
