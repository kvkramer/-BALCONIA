class SpheresController < ApplicationController
  before_action :set_sphere, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    # City search
    if params[:query].present?
      @spheres = Sphere.where('address ILIKE ?', "%#{params[:query]}%")
    else
      @spheres = Sphere.all
    end

    # Map
    @spheres.geocoded

      # Filtering options
      params.require(:search).permit(:balcony, :sunny, :quiet, :garden)
      choices = params["search"].select { |key, value| value != "" }
raise
    # price filtering
    if params[:price] == 'below 10'
      @spheres = Sphere.where("price < 20")
    elsif params[:price] == 'below 5'
      @spheres = Sphere.where("price < 10")
    elsif params[:price] == 'free'
      @spheres = Sphere.where("price = 0")
    else
      @spheres = Sphere.all
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
  end

  def new
    @sphere = Sphere.new
  end

  def create
    @user = current_user
    @sphere = Sphere.new(sphere_params)
    @sphere.user = @user
    if @sphere.save
      redirect_to sphere_path(@sphere)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sphere.update(sphere_params)
      redirect_to sphere_path(@sphere)
    else
      render :edit
    end
  end

  def destroy
    @spheres = Sphere.find(params[:id])
    @spheres.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to spheres_path
  end

  private

  # strong params
  def sphere_params
    params.require(:sphere).permit(:title, :address, :description, :price, :photo, :barbecue)
  end

  def set_sphere
    @sphere = Sphere.find(params[:id])
  end
end
