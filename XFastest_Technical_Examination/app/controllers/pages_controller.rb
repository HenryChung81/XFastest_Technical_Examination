class PagesController < ApplicationController
  def index
    @blogs = Blog.where(is_blog_manager: true).order(created_at: :desc).includes(:articles, :user)
  end
end
