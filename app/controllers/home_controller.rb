class HomeController < ApplicationController
  before_action :authenticate_member!

  def index
    if current_member.role == "barber"
      @appointments = Appointment.all # Barbers see all appointments
    else
      @appointments = current_member.appointments # Members see their own appointments
    end
  end
end
