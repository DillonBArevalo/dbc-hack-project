class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new

    if current_user
      @comment.user = current_user

      if @comment.save
        redirect_to @comment
      else
        flash[:notice] = 'Could not save comment.'
        redirect_to new_comment_path
      end
    else
      redirect_to new_session_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to @comment
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'Comment successfully deleted.'
    redirect_to group_path(current_user.group)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :description)
  end

end
