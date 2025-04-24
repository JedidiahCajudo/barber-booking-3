class AppointmentsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create, :index, :show, :destroy]

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

  # DELETE /appointments/:id
  def destroy
    @appointment = Appointment.find(params[:id])

    logger.debug "Attempting to delete appointment: #{@appointment.id}"

    # Check if the current user is the barber or the member who owns the appointment
    if current_member.role == "barber" || @appointment.member == current_member
      @appointment.destroy
      redirect_to appointments_path, notice: 'Appointment was successfully deleted.'
    else
      redirect_to appointments_path, alert: "You are not authorized to delete this appointment."
    end
  end

  private

  # No need for a before action check_barber for index anymore
  def check_barber
    # You can leave this method for other controller actions, if necessary
    # But for now, it’s only relevant for destroy, as you've already added checks there.
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :barber, :notes)
  end
end
