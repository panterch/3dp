class VideosController < ApplicationController

  protect_from_forgery :except => :create

  before_filter :prepare_resources

  def new
  end 

  def create
    if @photo.video
      @photo.video.destroy
      @photo.reload
    end
    unless params[:Filedata].blank?
      @video = @photo.build_video(:uploaded_data => params[:Filedata])
      @video.save!
      flash[:notice] = "Video successfully attached"
    end
    respond_to do |format|
      format.html { redirect_to category_path(@category) }
      format.js
    end
  end

  protected

    def prepare_resources
      @category = Category.find(params[:category_id])
      @photo = Photo.find(params[:photo_id]) 
    end
end
