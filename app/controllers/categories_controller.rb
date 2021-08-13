class CategoriesController < ApplicationController
  # GET Categories
  def index
    @categories = Category.all
  end

  # GET/Category/:id/show
  def show
    @category = Category.find(params[:id])
  end

  # GET New category
  def new
    @category = Category.new
  end

  # POST /Category
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  # GET/Category/:id/edit
  def edit
    @category = Category.find(params[:id])
  end

  # PATCH/Category/:id
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  # DELETE/Category/:id
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :cover) # cover?
  end
end
