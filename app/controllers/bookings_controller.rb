class BookingsController < ApplicationController

  def index
    #Find the user we're creating the booking for
    #@user = User.find(params[:user_id])
    # Asssociate the sphere and the user
    #@sphere.user = @user
    # Display all the bookings

    @bookings = booking.all

    # @user_bookings = booking.where(user = current_user)
  end

  def new
    @booking = booking.new
    set_sphere
  end

  def create
    set_sphere
    @user = current_user
    @price = @sphere.price
    @booking = booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.sphere = @sphere
    @booking.price = @price
    if @booking.save
      redirect_to bookings_path, notice: 'Added ingredient.'
    else
      render :new
    end
  end

  def destroy
    @bookings = booking.find(params[:id])
    @bookings.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to bookings_path, notice: 'This booking was cancelled.'
  end

  private

  def set_sphere
    @sphere = sphere.find(params[:sphere_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :price, :user_id, :sphere_id, :starttime, :endtime)
  end

end
