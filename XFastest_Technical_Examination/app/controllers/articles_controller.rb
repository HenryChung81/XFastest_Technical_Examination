class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog

  def index
  end

  def create
    @article = @blog.articles.new(article_params)
    @article.user = current_user

    if @article.save 
      redirect_to blog_articles_path, notice: '新增成功'
    else
      render :new
    end
  end


  private

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
