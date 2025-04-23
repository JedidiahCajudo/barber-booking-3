class AppointmentsController < ApplicationController
  class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show]

    # GET /appointments
    def index
      @appointments = Appointment.all
    end

    # GET /appointments/:id
    def show
    end

    # GET /appointments/new
    def new
      @appointment = Appointment.new
    end

    # POST /appointments
    def create
      @appointment = Appointment.new(appointment_params)

      if @appointment.save
        redirect_to @appointment, notice: 'Appointment was successfully created.'
      else
        render :new
      end
    end

    private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:member_id, :start_time, :barber, :notes)
    end
  end

end
