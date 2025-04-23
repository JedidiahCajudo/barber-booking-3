class AppointmentsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create, :index, :show] # Ensure the user is logged in
  before_action :check_barber, only: [:index] # Check if user is a barber

  # GET /appointments
  def index
    if current_member.role == "barber"
      @appointments = Appointment.all
    else
      @appointments = current_member.appointments
    end

    # Log the appointments to see if we're fetching them correctly
    logger.debug "Appointments: #{@appointments.inspect}"
  end


  def show
    @appointment = Appointment.find(params[:id])
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # POST /appointments
  def create
    @appointment = current_member.appointments.new(appointment_params)

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  private

  def check_barber
    redirect_to root_path, alert: "You are not authorized to view this page" unless current_member.role == "barber"
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :barber, :notes)
  end
end
