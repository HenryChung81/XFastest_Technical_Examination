class PagesController < ApplicationController
  before_action :find_blog, only: [:articles, :show ]

  def index
    @blogs = Blog.where(is_blog_manager: true).order(created_at: :desc).includes(:articles, :user)
  end

  def articles
    @articles = @blog.articles.where(status: 'published').order(created_at: :desc).includes(:blog)
  end

  def show
    @article = @blog.articles.find(params[:article_id])
  end

  private

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

end
