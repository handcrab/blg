class PostsController < ApplicationController
  def index
    @posts = Post.all.order 'created_at DESC'
  end

  def show
    @post = Post.find_by params[:id]
  end


  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end


  def new
    @post = Post.new
  end

  def update
  end

  private
    def post_params
      params.require(:post).permit :title, :body
    end
  
end
