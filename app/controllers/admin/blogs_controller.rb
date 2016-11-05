class Admin::BlogsController < AdminController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Admin::Blog.order("created_at desc").page(params[:page])
  end

  def show
  end

  def new
    @blog = Admin::Blog.new
  end

  def edit
  end

  def create
    @blog = Admin::Blog.new(blog_params)
    if @blog.save
      redirect_to admin_blog_url(@blog)
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to admin_blog_url(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
      redirect_to admin_blogs_url
  end

  private

  def set_blog
    @blog = Admin::Blog.find(params[:id])
  end

  def blog_params
    params.require(:admin_blog).permit(:title, :content)
  end
end
