class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog
  before_action :find_article , only: [:edit, :update, :destroy ]

  def index
    @articles = @blog.articles.order(created_at: :desc)
  end

  def new
    @article = @blog.articles.new
  end

  def show
    
  end

  def create
    @article = @blog.articles.new(article_params)
    @article.status = 'published' if params[:publish]
    @article.user = current_user

    if @article.save
      if params[:publish]
        redirect_to blog_articles_path, notice: '文章已發佈'
      else
        # redirect_to edit_blog_article_path(@blog, @article), notice: '文章已儲存'
        redirect_to blog_articles_path, notice: '文章已儲存'
      end
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @article.update(article_params)
        redirect_to edit_blog_article_path(@blog, @article), notice: '文章已儲存'
    else
      redner :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blog_articles_path, notice: '文章已刪除'
  end

  private

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

  def find_article
    @article = @blog.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
  
end
