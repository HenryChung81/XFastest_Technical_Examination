Rails.application.routes.draw do
  get 'articles/index'
  devise_for :users
  # get 'blogs/index'

  resources :blogs do
    resources :articles
  end

  get 'page/:blog_id/articles', to: 'pages#articles', as: 'blog_articles_page'
  get 'page/:blog_id/article/:article_id', to: 'pages#show', as: 'show_blog_article'

  
  
  root to: "pages#index"
end
