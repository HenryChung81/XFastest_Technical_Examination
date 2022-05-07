class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only: [:edit, :update, :destroy]


  def index
    @blogs = current_user.blogs.order(created_at: :desc)
  end

  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'blog 已刪除'
  end

  private
  def find_blog
    @blog = current_user.blogs.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name)
  end

end
