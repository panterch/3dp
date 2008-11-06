class PhotosController < ApplicationController

  before_filter :prepare_category

  def index
    @photos = Photo.find_all_by_parent_id(nil)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    # Standard, one-at-a-time, upload action
    @photo = Photo.new(params[:photo])
    @photo.save!
    redirect_to photos_url
  rescue
    render :action => :new
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url
  end

  protected
    
    def prepare_category
      @category = Category.find(params[:category_id])
      @categories = Category.all
    end

end
