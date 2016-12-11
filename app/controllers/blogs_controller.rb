class BlogsController < UserController
  def index
    @blogs = Blog.order(created_at: :desc).page(params[:page])
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
