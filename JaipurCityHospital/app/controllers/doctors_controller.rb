class DoctorsController < ApplicationController

  # before_action :logged_in_doctor, only: [:index, :edit, :update, :destroy]
  # before_action :correct_doctor, only: [:edit, :update]
  # before_action :admin_doctor, only: :destroy

  def index
    @doctors = Doctor.paginate(page: params[:page])
  end

  def show
    @doctor = Doctor.find(params[:id])
    # redirect_to root_url and return unless @doctor.activated?
    # debugger
  end

  def new
    # debugger
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      # @doctor.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      # log_in @doctor
      # flash[:success] = "Welcome to Sample App!"
      redirect_to @doctor
    else
      render 'new'
    end
  end
  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      flash[:success] = "Profile updated"
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
    Doctor.find(params[:id]).destroy
    flash[:success] = "Doctor deleted"
    redirect_to doctors_url
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
