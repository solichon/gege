class BookingsController < ApplicationController

  def new
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking = Booking.new
    authorize @booking
    #Avoir un JS qui fait apparaitre "Votre prix total est @booking.total_price"
  end

  def create
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking = Booking.new(booking_params)
    @booking.timeslot = @timeslot
    authorize @booking
    if @booking.save
      redirect_to timeslot_path(@booking.timeslot)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:adults, :children, :comments,
     :status, :activity, :timeslot_id, :client_id, :channel_source)
  end
end
