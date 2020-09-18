class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  def index
    @houses = House.all
  end

  def show
    @nearest_stations = @house.nearest_stations
    @i = 0
  end

  def new
    @house = House.new
    @nearest_stations = @house.nearest_stations
    2.times{@house.nearest_stations.build}
  end

  def edit
    @nearest_stations = @house.nearest_stations
    @house.nearest_stations.build
  end

  def create
    @house = House.new(house_params)
      if @house.save
        redirect_to @house, notice: 'House was successfully created.'
      else
        render :new
      end
  end

  def update
      if @house.update(house_params)
        redirect_to @house, notice: 'House was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @house.destroy
    redirect_to houses_url, notice: 'House was successfully destroyed.'
  end

  private
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:house_name, :rent_fee, :address, :age, :note, nearest_stations_attributes: [:id, :line, :station, :minutes, :_destroy])
    end

end
