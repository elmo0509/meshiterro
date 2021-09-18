class PostCommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
  end

end
