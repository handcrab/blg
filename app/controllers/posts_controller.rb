class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all.order 'created_at DESC'
  end

  def show    
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

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Success"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Success'
  end

  private
    def set_post  
      @post = Post.find params[:id]  
    end

    def post_params
      params.require(:post).permit :title, :body
    end
  
end
