class BooksController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to "/books"
    end
  end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
