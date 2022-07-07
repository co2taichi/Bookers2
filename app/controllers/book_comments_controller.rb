class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token   # トークンを無視 解決策として正しいかわからない

  def create
    userID = current_user.id
    book = Book.find(params[:book_id])
    # comment = current_user.book_comments.new(book_comment_params)
    comment = BookComment.new(book_comment_params)
    comment.user_id = userID
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    BookComment.find(params[:book_id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
