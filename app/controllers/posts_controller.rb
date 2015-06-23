class PostsController < ApplicationController
  before_action :set_post, :only => [:show, :edit, :update, :destroy]
  private

  def set_post
        @post =Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)

  end

  public

  def index
    @posts = Post.all
  end

  def new
    @post =Post.new
  end

  def create
    @post =Post.new(params[:post])
    @post.save
    redirect_to posts_url
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_url(@post), :id => @post
  end

  def destroy
    @post.destroy
    redirect_to :action => :index
  end

  def show
  end


end
