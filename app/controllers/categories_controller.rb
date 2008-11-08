class CategoriesController < ApplicationController

  before_filter :prepare_category

  def index
  end

  def show
    respond_to do |format|
      format.html
      format.xml
    end
  end

  protected
    
    def prepare_category
      @category = Category.find(params[:id]) if params[:id]
    end
end
