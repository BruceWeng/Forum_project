class AboutController < ApplicationController
  def show
    @user = User.count
    @post = Post.count
    @comment = Comment.count
  end
end
