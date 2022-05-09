Rails.application.routes.draw do
  get 'pages/index'
  get 'articles/index'
  devise_for :users
  # get 'blogs/index'

  resources :blogs do
    resources :articles
  end
  
  
  root to: "pages#index"
end
