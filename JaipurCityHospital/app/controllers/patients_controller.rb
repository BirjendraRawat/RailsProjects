class PatientsController < ApplicationController

  # before_action  only: [:index, :edit, :update, :destroy]
  # before_action :correct_patient, only: [:edit, :update]
  before_action  :admin_user, only: [:create ,:new, :edit, :update, :destroy]

#   @doctors = Doctor.all
#   @doctors_for_dropdown = []
#   @doctors.each do |i|
#   @doctors_for_dropdown = @doctors_for_dropdown << [i.department]
# end

# @department = User::DEPARTMENTS
# @department_for_dropdown = []
# @department.each do |key, value|
#   @department_for_dropdown = @department_for_dropdown << [value]
# end

# @doctors = Doctor.all
# @doctors_for_dropdown = []
# @doctors.each do |i|
#   @doctors_for_dropdown = @doctors_for_dropdown << [i.name,i.id,{:class => i.department.value}]
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
    # debugger
    @doctor = Doctor.find_by(id: params[:patient][:doctor_id])


    @patient = Patient.new(patient_params)
    if current_user.admin?
      if @patient.save
        @patient.doctors << @doctor
        # @patient.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        # log_in @patient
        # flash[:success] = "Welcome to Sample App!"
        redirect_to @patient
      else
        render 'new'
      end
    else
      redirect_to root_url, alert: "You can't add Patients as you are not Admin."
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
    # debugger
    @doctor = Doctor.find_by(id: params[:patient][:doctor_id])
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      @patient.doctors << @doctor
      flash[:success] = "Profile updated"
      redirect_to @patient
    else
      render 'edit'
    end
  end

  # Confirms an admin user.
  def admin_user
    # debugger
    redirect_to(root_url) unless current_user.admin?
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :email, :phone, :password, :password_confirmation, :image, :department, :doctor_id)
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


end
