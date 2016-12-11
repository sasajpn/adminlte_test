class Mypage::BlogsController < MypageController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to mypage_blog_url(@blog)
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to mypage_blog_url(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
      redirect_to mypage_blogs_url
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
