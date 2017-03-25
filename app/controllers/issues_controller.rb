class IssuesController < ApplicationController

  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new

    if current_user
      @issue.user = current_user

      if @issue.save
        redirect_to @issue
      else
        flash[:notice] = 'Could not save issue.'
        redirect_to new_issue_path
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
    if @issue.update(issue_params)
      flash[:notice] = 'Issue was successfully updated.'
      redirect_to @issue
    else
      render :edit
    end
  end

  def destroy
    @issue.destroy
    flash[:notice] = 'Issue successfully deleted.'
    redirect_to group_path(current_user.group)
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description)
  end

end
