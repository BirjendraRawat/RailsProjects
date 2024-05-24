class PatientsController < ApplicationController

  before_action  only: [:index, :edit, :update, :destroy]
  # before_action :correct_patient, only: [:edit, :update]
  before_action  only: :destroy

#   @doctors = Doctor.all
#   @doctors_for_dropdown = []
#   @doctors.each do |i|
#   @doctors_for_dropdown = @doctors_for_dropdown << [i.department]
# end

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
    params.require(:patient).permit(:name, :email, :password, :password_confirmation, :image, :department, :doctor)
  end

  # Confirms a logged-in user
  def logged_in_patient
    # unless logged_in?
    #   store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  # end



  # Returns true if the given user is the current user
  # def current_patient?(patient)
  #   patient && patient == current_patient
  # end

  # Confirms an admin user.
  # def admin_patient
  #   # debugger
  #   redirect_to(root_url) unless @patient.admin?
  # end
end
