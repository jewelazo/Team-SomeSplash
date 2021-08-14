class PhotosController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @categories = Category.all
    @photo = Photo.new(category: @category)
  end

  def edit
    @photo = Photo.find(params[:id])
    @categories = Category.all
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to category_photo_path(@photo)
    else
      render :edit
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to category_path(@photo.category)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :image)
  end
end
