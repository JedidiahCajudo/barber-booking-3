class AppointmentsController < ApplicationController
  before_action :set_member, only: [:new, :create]

  # GET /appointments
  def index
    @appointments = Appointment.all # Load all appointments
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.member_id = @member.id # Automatically assign the member

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  private

  def set_member
    @member = Member.first # Assuming you always have one member
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :barber, :notes)
  end
end
