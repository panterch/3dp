ActionController::Routing::Routes.draw do |map|

  map.resources :categories do |categories|
    categories.resources :photos
  end

end
