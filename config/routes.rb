ActionController::Routing::Routes.draw do |map|

  map.resources :categories do |categories|
    categories.resources :photos do |photos|
      photos.resource :video
    end
  end

end
