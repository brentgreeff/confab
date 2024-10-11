class CommentsController < ApplicationController
  def create
    @comment = Current.user.comments.build(safe_params)

    if @comment.save
      flash.now[:notice] = "New comment added!"
    else
      flash.now[:alert] = "Error adding comment"
    end
  end

  private

  def safe_params
    params.require(:comment).permit(:text)
  end
end
