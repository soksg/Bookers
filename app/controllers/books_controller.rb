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
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    end
  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

 private
  def book_params
    params.requier(:book).permit(:title, :body)
  end

end