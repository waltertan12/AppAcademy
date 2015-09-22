class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to :back
    else
      flash[:errors] = "AHHH"
      redirect_to :back
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :spooky, :commentable_type, :commentable_id)
  end
end
