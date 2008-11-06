class PhotosController < ApplicationController

  before_filter :prepare_category

  def index
    @photos = @category.photos
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    # Standard, one-at-a-time, upload action
    @photo = @category.photos.build(params[:photo])
    if @photo.save
      redirect_to category_photos_url(@category)
    else
      render :action => :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to category_photos_url(@category)
  end

  protected
    
    def prepare_category
      @category = Category.find(params[:category_id])
      @categories = Category.all
    end

end
