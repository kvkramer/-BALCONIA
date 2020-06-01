class SpheresController < ApplicationController
  before_action :set_sphere, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @spheres = Sphere.all

    # map
    @spheres = Sphere.geocoded
    @markers = @spheres.map do |sphere|
      {
        lat: sphere.latitude,
        lng: sphere.longitude
      }
    end

    # city search
    if params[:query].present?
      @spheres = Sphere.where('address ILIKE ?', "%#{params[:query]}%")
    else
      @spheres = Sphere.all
    end

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
      redirect_to spheres_path
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
    t.boolean "barbecue"
    params.require(:sphere).permit(:address, :description, :price, :photos, :barbecue)
  end

  def set_sphere
    @sphere = Sphere.find(params[:id])
  end
end
