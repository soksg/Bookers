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
      redirect_to book_path(book.id)
      flash[:notice] = "Book was successfully created."
    else
      flash[:alert] = "Book was successfully created."
    end
  end

  def update
     book=Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(book.id)
    end
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