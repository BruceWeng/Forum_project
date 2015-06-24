class PostsController < ApplicationController
  before_action :authenticate_user!
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
    @post = Post.new
  end

  def create
    Rails.logger.info('=========')
    Rails.logger.info(params)
    Rails.logger.info('=========')
    Rails.logger.info(post_params)
    Rails.logger.info('=========')
    @post = Post.new(post_params)

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
    @comment = Comment.new

  end


end
