class BookingsController < ApplicationController
  def index
    @celebrity = Celebrity.find(params[:celebrity_id])
    @bookings = @celebrity.bookings
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @celebrity = Celebrity.find(params[:celebrity_id])
    @booking.celebrity = @celebrity
    @booking.user = current_user
    if @booking.save
      redirect_to celebrity_path(@celebrity)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @celebrity = @booking.celebrity
    @booking.update!(booking_params)
    if @booking.save
      redirect_to celebrity_path(@celebrity)
    else
      render 'celebrity/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.destroy
    authorize @booking
    redirect_to celebrity_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date_debut, :date_fin)
  end
end
