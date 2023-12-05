class BlogController < ApplicationController
  def index 
    @blogs = Blog.all
  end

  def show
    @blogs = Blog.find(params[:id])
  end

  def new 
    @blog = Blog.new
  end


  def create 
    @blog = Blog.create (blog_params)
    if @blog.valid?
      redirect_to blogs_path
    end
  end

  def edit
    @blogs= Blog.find(params[:id])
  end

  def update 
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path(@blogs)
    end
  end

  def destroy
    @blogs = Blog.find(params[:id])
    if @blogs.destroy
      redirect_to blogs_path
    end
  end

  private
  def blog_params
   params.require(:blog).permit(:title, :content)
  end
end
