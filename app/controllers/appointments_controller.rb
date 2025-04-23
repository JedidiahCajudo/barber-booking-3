class AppointmentsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create] # Ensure the user is logged in

  # GET /appointments
  def index
    @appointments = current_member.appointments # Fetch only the appointments for the logged-in member
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
  end


  # POST /appointments
  def create
    @appointment = current_member.appointments.new(appointment_params) # Use current_member to create the appointment

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :barber, :notes)
  end
end
