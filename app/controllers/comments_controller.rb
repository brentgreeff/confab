class CommentsController < ApplicationController
  def create
    @comment = Comment.new(safe_params)

    if @comment.save
      flash.now[:success] = "New comment added!"
    else
      flash.now[:error] = "Error adding comment"
    end
  end

  private

  def safe_params
    params.require(:comment).permit(:text)
  end
end
