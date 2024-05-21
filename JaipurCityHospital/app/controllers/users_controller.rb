class UsersController < ApplicationController

  before_action  only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    @patients = Patient.paginate(page: params[:page])
    @doctors = Doctor.paginate(page: params[:page])
  end

  def edit
    @doctor = Doctor.find(params[:id])
    @patient = Patient.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      flash[:success] = "Profile updated"
      redirect_to @doctor
    else
      render 'edit'
    end

    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:success] = "Profile updated"
      redirect_to @patient
    else
      render 'edit'
    end

  end

  def destroy
    if @user.admin?
    Doctor.find(params[:id]).destroy
    flash[:success] = "Doctor deleted"
    redirect_to doctors_url
  else
    flash[:danger] = "can not delete doctor"
  end

    if @user.admin?
    Patient.find(params[:id]).destroy
    flash[:success] = "Patient deleted"
    redirect_to patients_url
  else
    flash[:danger] = "can not delete patient"
  end

  end

  def admin_user
    # debugger
    redirect_to(root_url) unless current_user.admin?
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :email, :password, :password_confirmation, :image)
  end

  def patient_params
    params.require(:patient).permit(:name, :email, :password, :password_confirmation, :image)
  end

end
