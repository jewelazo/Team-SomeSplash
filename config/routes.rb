# Rails.application.routes.draw do
#   root to: 'categories#index'
#   #resources :comments
#   #resources :photos
#  # resources :categories
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# #end

Rails.application.routes.draw do
  root to: 'categories#index'
  resources :photos do
    resources :comments
  end

  resources :categories do
    resources :photos
    resources :comments
  end
  # For details on the DSL available within
  resources :comments
end
