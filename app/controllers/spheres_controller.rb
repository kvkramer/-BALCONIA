class SpheresController < ApplicationController
  before_action :set_sphere, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

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
    else
      @spheres = policy_scope(Sphere).all
    end

    # # Filtering options
    # params.require(:search).permit(:balcony, :sunny, :quiet, :garden)
    # choices = params["search"].select { |key, value| value != "" }

    # price filtering
    # if params[:price] == 'below 10'
    #   @spheres = policy_scope(Sphere).where("price < 20")
    # elsif params[:price] == 'below 5'
    #   @spheres = policy_scope(Sphere).where("price < 10")
    # elsif params[:price] == 'free'
    #   @spheres = policy_scope(Sphere).where("price = 0")
    # else
    #   @spheres = policy_scope(Sphere).all
    # end

    @markers = @spheres.geocoded.map do |sphere|
      {
        lat: sphere.latitude,
        lng: sphere.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { sphere: sphere })
        # image_url: helpers.asset_url('spheres/1.jpg')
      }
    end

  end

  def show
    authorize @sphere
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
      redirect_to sphere_path(@sphere), notice: 'Saved successfully'
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
    redirect_to root_path, notice: 'This deleted successfully.'
  end

  private

  # strong params
  def sphere_params
    params.require(:sphere).permit(:title, :address, :description, :price, :photo, :barbecue, :balcony, :garden, :terrace, :sunny, :highspeed_wifi, :plants, :quiet, :spacious_desk, :cozy, :pet_friendly)
  end

  def set_sphere
    @sphere = Sphere.find(params[:id])
  end
end
