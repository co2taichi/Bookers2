class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token #HACK:

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      flash[:notice] = "You have created comment successfully."
    end
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    if book_comment.user == current_user
      book_comment.destroy
    end
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
