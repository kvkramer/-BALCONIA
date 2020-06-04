class SpheresController < ApplicationController
  before_action :set_sphere, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    # City search
    @spheres = policy_scope(Sphere)
    if params[:query].present?
      @spheres = Sphere.where('address ILIKE ?', "%#{params[:query]}%")
    elsif params[:search].present?
      search_params = params[:search].select { |key, value| value == 'true'}
      search_params.permit!
      @spheres = Sphere.where(search_params)
    else
      @spheres = Sphere.all
    end

    # Map
    @spheres.geocoded

    # price filtering
    if params[:price] == 'below 10'
      @spheres = policy_scope(Sphere).where("price < 20")
    elsif params[:price] == 'below 5'
      @spheres = policy_scope(Sphere).where("price < 10")
    elsif params[:price] == 'free'
      @spheres = policy_scope(Sphere).where("price = 0")
    else
      @spheres
    end

    @markers = @spheres.map do |sphere|
      {
        lat: sphere.latitude,
        lng: sphere.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { sphere: sphere }),
        image_url: helpers.asset_url('spheres/1.jpg')
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
