class ReviewsController < ApplicationController

  def new
    @sphere = Sphere.find(params[:sphere_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end 

    def create
        @booking = Booking.find(params[:booking_id])
        @review = Review.new(review_params)
        authorize @review
        @review.booking = @booking
        if @review.save
          redirect_to bookings_path
        else
          render "new"
        end
    end
    
      private
    
      def review_params
        params.require(:review).permit(:rating, :description)
      end
end
