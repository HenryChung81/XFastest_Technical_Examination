Rails.application.routes.draw do
  devise_for :users
  # get 'blogs/index'
  root to: "blogs#index"
end
