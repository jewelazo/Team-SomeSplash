Rails.application.routes.draw do
  root to: 'categories#index'
  get '/search' => 'photos#search', :as => 'search_photo'
  resources :photos do
    resources :comments
  end

  resources :categories do
    resources :photos
    resources :comments
  end
  # For details on the DSL available within
  resources :searches
  resources :comments
end
