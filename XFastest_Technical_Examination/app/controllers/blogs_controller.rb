class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blogs = Blog.all
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
    @blog = current_user.blogs.new
  end

  private
  def blog_params
    params.require(:blog).permit(:name)
  end

end
