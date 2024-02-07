class BookingsController < ApplicationController
  def create
    shelter = Shelter.find(params[:shelter_id])
    booking = Booking.create(shelter_id: shelter.id, user: current_user)
    bed = Bed.find(params[:bed_id])
    bed.update(status: "ocupada")
  end
end
