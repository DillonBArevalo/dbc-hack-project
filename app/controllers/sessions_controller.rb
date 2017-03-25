class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:id] = @user.id
      redirect_to @user
    else
      flash[:notice] = 'Username or Password incorrect'
      render :new
    end
  end

  def destroy
    session[:id] = nil
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
