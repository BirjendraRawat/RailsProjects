class PatientsController < ApplicationController

  # before_action :logged_in_patient, only: [:index, :edit, :update, :destroy]
  # before_action :correct_patient, only: [:edit, :update]
  # before_action :admin_patient, only: :destroy

  def index
    @patients = Patient.all
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

  private
  def patient_params
    params.require(:patient).permit(:name, :email, :password, :password_confirmation)
  end
end
