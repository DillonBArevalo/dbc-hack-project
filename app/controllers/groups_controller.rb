class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new

    if current_user && current_user.is_instructor
      flash[:notice] = 'Instructors cannot create groups.'
      redirect_to index
    elsif current_user
      render :new
    end
  end

  def create
    @group = Group.new

    if current_user && !current_user.is_instructor
      @group.owner = current_user.id

      if @group.save
        current_user.group = @group.id
        redirect_to @group
      else
        flash[:notice] = 'Could not save group.'
        redirect_to new_group_path
      end
    elsif current_user && current_user.is_instructor
        flash[:notice] = 'Instructors cannot create groups.'
        redirect_to index
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
    params.require(:group).permit(:name)
  end
end
