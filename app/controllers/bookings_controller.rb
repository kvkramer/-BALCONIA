class BookingsController < ApplicationController
before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  skip_after_action :verify_authorized

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def index

    #Find the user we're creating the booking for
    #@user = User.find(params[:user_id])
    # Asssociate the sphere and the user
    #@sphere.user = @user
    # Display all the bookings

    #@bookings = policy_scope(Booking).all
    @user_bookings = policy_scope(Booking).where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
     @review = Review.new
   end

  def new
    @booking = Booking.new
    set_sphere
    authorize @booking
  end

  def create
    set_sphere
    @user = current_user
    @cost_per_day = @sphere.cost_per_day
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.sphere = @sphere
    @booking.cost_per_day = @cost_per_day
    authorize @booking
    if @booking.save
      redirect_to bookings_path, notice: 'added booking'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to bookings_path, notice: 'this booking was cancelled'
  end



  #def reviews
    #@booking = Booking.find(params[:id])
    #@review.booking = @booking
  #end


  private

  def set_sphere
    @sphere = Sphere.find(params[:sphere_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :booking_cost_per_day, :user_id, :sphere_id, :starttime, :endtime, :status)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
