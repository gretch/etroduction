class CommentsController < ApplicationController
  def create
    @content = Content.find(params[:comment][:content_id])
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user
    @comment.author_name = current_user.login
    @content.comments << @comment
    @content.increment!(:comments_count)  
  
    if @comment.save
      flash[:notice] = 'Comment successfully posted.'
    else
      flash[:notice] = 'Error trying to save your comment.'
    end

    respond_to do |format|
      format.html { redirect_to content_path(@content)}
    end
  end
end
