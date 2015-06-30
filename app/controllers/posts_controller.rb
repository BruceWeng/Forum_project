class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, :only => [:show]
  before_action :set_my_post, :only => [:edit, :update, :destroy]
  def index
    prepare_variable_for_index_template
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    @post.save # TODO: handle validation error

    redirect_to posts_url
  end

  def edit
  end

  def update
    if params[:_remove_logo] == "1"
      @post.logo = nil
    end

    @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @post.destroy
    redirect_to :action => :index
  end

  def show
    @comment = Comment.new
  end

  private

  def prepare_variable_for_index_template
    if params[:cid]
      @category = Category.find( params[:cid] )
      @posts = @category.posts
    else
      @posts = Post.all
    end

    if params[:order_by_time]
      @posts = @posts.order("comments_time DESC")
    elsif params[:order_by_count]
      @posts = @posts.order("comments_count DESC")
    else
      @posts = @posts.order("id DESC")
    end


    @posts = @posts.page(params[:page]).per(5)
  end

  def set_post
    @post =Post.find(params[:id])
  end

  def set_my_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:logo, :title, :content, :category_ids => [])
  end

end
