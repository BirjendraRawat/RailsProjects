class PatientsController < ApplicationController

  # before_action :logged_in_patient, only: [:index, :edit, :update, :destroy]
  # before_action :correct_patient, only: [:edit, :update]
  # before_action :admin_patient, only: :destroy

  def index
    @patients = Patient.paginate(page: params[:page])
  end

  def show
    @patient = Patient.find(params[:id])
    # redirect_to root_url and return unless @patient.activated?
    # debugger
  end

  def new
    # debugger
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      # @patient.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      # log_in @patient
      # flash[:success] = "Welcome to Sample App!"
      redirect_to @patient
    else
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def destroy
    Patient.find(params[:id]).destroy
    flash[:success] = "Patient deleted"
    redirect_to patients_url
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:success] = "Profile updated"
      redirect_to @patient
    else
      render 'edit'
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
