class UsersController < ApplicationController

  def index
    @users = User.all
    render layout: 'CreateForm'
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  # def create
  #   book = Book.new(book_params)
  #   book.user_id = current_user.id
  #   if book.save
  #     redirect_to "/books"
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
