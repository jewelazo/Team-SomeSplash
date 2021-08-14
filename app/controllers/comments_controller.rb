class CommentsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @comment = @category.comments.create(comment_params)
      redirect_to category_path(@comment.commentable_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to category_path(@comment.commentable_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end