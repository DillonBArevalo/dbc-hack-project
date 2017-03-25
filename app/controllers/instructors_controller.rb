class InstructorsController < ApplicationController

  include SessionsHelper

  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @instructor = Instructor.new
  end

  def edit

  end

  def create
    @instructor = Instructor.new(instructor_params)

    if instructor_params[:password] == instructor_params[:password_confirmation]
      if @instructor.save
        session[:id] = @instructor.id
         flash[:notice] =  'Instructor successfully created.'
      else
        render :new
      end
    else
      flash[:notice] = 'Passwords must match.'
      render :new
    end
  end

  def update
    if @instructor.update(instructor_params)
      flash[:notice] = 'Instructor was successfully updated.'
      redirect_to @instructor
    else
      render :edit
    end
  end

  def destroy
    @instructor.destroy
      flash[:notice] = 'Instructor successfully deleted.'
      redirect_to rides_path
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
    redirect_to new_session_path unless @instructor.id == current_instructor.id
  end

  def instructor_params
    params.require(:instructor).permit(:name,
                                 :phone,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
