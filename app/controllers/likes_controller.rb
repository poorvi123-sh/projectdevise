class LikesController < ApplicationController
	before_action :find_post
  before_action :find_like, only: [:destroy]
  
  def create
     @post.likes.create(user_id: current_user.id)
      respond_to do |format|
        format.js
    end
  end


def destroy  
    @like.destroy
    @post=Post.find(params[:post_id])
    respond_to do |format|
        format.js
    end
end

  private
  def find_post
    if params[:comment_id]
     @comment=Comment.find(params[:comment_id])
    else
      @post=Post.find(params[:post_id])
  end
  
 end

  def already_liked?
   if params[:comment_id]
  Like.where(user_id: current_user.id, likeable_id:
  params[:comment_id]).exists?
 else
  Like.where(user_id: current_user.id, likeable_id:
  params[:post_id]).exists?
end

end

def find_like
   @like = @post.likes.find(params[:id])
end

end
