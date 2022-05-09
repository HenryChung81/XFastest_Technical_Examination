class PagesController < ApplicationController
  def index
    @blogs = Blog.all.order(created_at: :desc).includes(:articles, :user)
  end
end
