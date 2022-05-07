Rails.application.routes.draw do
  get 'articles/index'
  devise_for :users
  # get 'blogs/index'

  resources :blogs do
    resources :articles
  end
  
  
  root to: "blogs#index"
end
