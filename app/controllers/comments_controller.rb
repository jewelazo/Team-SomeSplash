class CommentsController < ApplicationController
  def create
    if params[:category_id].blank?
      condition_photos
    else
      condition_categories
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.commentable_type == 'category'
      redirect_to photo_path(@comment.commentable_id)
    else
      redirect_to category_path(@comment.commentable_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def condition_categories
    @category = Category.find(params[:category_id])
    @comment = @category.comments.create(comment_params)
    redirect_to category_path(@comment.commentable_id)
  end

  def condition_photos
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to photo_path(params[:photo_id])
  end
end
