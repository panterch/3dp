# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1912273aafa5ff94f0eb8180b7dc7e7e'

  before_filter :prepare_categories

  protected
    
    def prepare_categories
      @categories = Category.all
    end
end
