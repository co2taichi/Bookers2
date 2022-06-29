class BooksController < ApplicationController
  def new
  end

  def show
    @book = Book.find(params[:id])
    render layout: 'CreateForm'
  end

  def edit
    @book = Book.find(params[:id])
  end
  def index
    @books = Book.all
    render layout: 'CreateForm'
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to "/books"
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end


 private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
