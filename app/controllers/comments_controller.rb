class CommentsController < ApplicationController
  before_action :authenticate_user!

  def comment_params
    params.require(:comment).permit(:content)
  end
  def create
    # @comment = Comment.new(comment_params.merge(:post_id => params[:post_id]))
    # @comment.save

    # @comment = Post.find(params[:post_id]).comments.create(comment_params)
    # redirect_to post_path(params[:post_id])

    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post_path(post)
  end

end
