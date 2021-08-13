class CommentsController < ApplicationController
  # GET /comments/:id
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new?category_id="1"
  def new
    @comment = Comment.new(category_id: params[:category_id])
  end

  # POST /employees
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to categories_path(@comment.category)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
