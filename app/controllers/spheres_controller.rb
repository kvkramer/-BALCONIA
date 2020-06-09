class SpheresController < ApplicationController
  before_action :set_sphere, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index, :list]

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def index

    # City search
    if params[:query].present?
      @spheres = policy_scope(Sphere).where('address ILIKE ?', "%#{params[:query]}%")
    elsif params[:search].present?
      search_params = params[:search].select { |key, value| value == 'true'}
      search_params.permit!
      @spheres = policy_scope(Sphere).where(search_params)
    else
      @spheres = policy_scope(Sphere).all
    end

    # price filtering
    if params[:cost_per_day] == 'below 20'
      @spheres = policy_scope(Sphere).where("cost_per_day < 20")
    elsif params[:cost_per_day] == 'below 10'
      @spheres = policy_scope(Sphere).where("cost_per_day < 10")
    elsif params[:cost_per_day] == 'free'
      @spheres = policy_scope(Sphere).where("cost_per_day = 0")
    end

    # Follower filter
    if params[:search]
      current_user.following.each do |following|
        @spheres = policy_scope(Sphere).where(user_id: following)
      end
    else
      @spheres = policy_scope(Sphere).all
    end


    @markers = @spheres.geocoded.map do |sphere|
      {
        lat: sphere.latitude,
        lng: sphere.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { sphere: sphere })
      }
    end

  end

  def show
    authorize @sphere
    @bookings = Booking.where(sphere: @sphere)
  end

  def new
    @sphere = Sphere.new

    authorize @sphere
  end

  def create
    @user = current_user
    @sphere = Sphere.new(sphere_params)
    @sphere.user = @user

    authorize @sphere

    if @sphere.save
      redirect_to sphere_path(@sphere), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
    authorize @sphere
  end

  def update

    authorize @sphere

    if @sphere.update(sphere_params)
      redirect_to sphere_path(@sphere), notice: 'saved successfully'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @sphere = Sphere.find(params[:id])

    authorize @sphere

    @sphere.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to root_path, notice: 'deleted successfully'
  end

  private

  # strong params
  def sphere_params
    params.require(:sphere).permit(:title, :address, :description, :cost_per_day, :barbecue, :balcony, :garden, :terrace, :sunny, :highspeed_wifi, :plants, :quiet, :spacious_desk, :cozy, :pet_friendly, photos: [])
  end

  def set_sphere
    @sphere = Sphere.find(params[:id])
  end
end
