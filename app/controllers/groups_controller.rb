class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new

    if current_user
      @group.owner = current_user.id

      if @group.save
        redirect_to @group
      else
        flash[:notice] = 'Could not save group.'
        redirect_to new_group_path
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
    if @group.update(group_params)
      flash[:notice] = 'Group was successfully updated.'
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = 'Group successfully deleted.'
    redirect_to groups_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:instructor).permit(:name)
  end
end
