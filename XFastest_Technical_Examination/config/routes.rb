Rails.application.routes.draw do
  devise_for :users
  # get 'blogs/index'

  resources :blogs
  
  root to: "blogs#index"
end
