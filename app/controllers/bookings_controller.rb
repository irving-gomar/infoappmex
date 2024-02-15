class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    bedid = params[:bed_id]
    booking = Booking.create(bed_id: bedid, user: current_user, date: Date.today)
    bed = Bed.find(bedid)
    if booking.save
      bed.update(status: "ocupada")
      redirect_to bookings_path
    else
      render :new
    end
  end

  def restore 
    bedid = params[:bed_id]
    bed = Bed.find(bedid)
    bed.status = "disponible"
    bed.save!
    bookings = Booking.all
    bookings.each do |bkn|
      if bkn.bed_id = bedid && bed.status == "disponible"
        bkn.destroy
      end
    end
    head :no_content
  end

  def my_bookings
    @bookings = current_user.bookings
  end
end
