class User::BlogsController < UserController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = User::Blog.order(:id).page(params[:page])
  end

  def show
  end

  def new
    @blog = User::Blog.new
  end

  def edit
  end

  def create
    @blog = User::Blog.new(blog_params)
    if @blog.save
      redirect_to user_blog_url(@blog)
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to user_blog_url(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
      redirect_to user_blogs_url
  end

  private

  def set_blog
    @blog = User::Blog.find(params[:id])
  end

  def blog_params
    params.require(:user_blog).permit(:title, :content)
  end
end
