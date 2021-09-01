class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def like
    comment = Comment.find(params[:id])
    comment.increment!(:likes)
    flash[:success] = 'Thanks for sharing your opinion!'
    redirect_to article_path(comment.article)
  end

end
