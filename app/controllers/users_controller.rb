class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show

    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def edit

    @user = User.find(params[:id])

  end

  def create
    @user = User.new(user_params)

    if user_params[:password] == user_params[:password_confirmation]
      if @user.save
        session[:id] = @user.id
        flash[:notice] =  'User successfully created.'
      else
        render :new
      end
    else
      flash[:notice] = 'Passwords must match.'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User successfully deleted.'
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to new_session_path unless @user.id == current_user.id
  end

  def user_params
    params.require(:user).permit(:name,
                                 :phone,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
