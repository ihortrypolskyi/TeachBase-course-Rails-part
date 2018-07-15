  class RoutesController < ApplicationController
  before_action :initialize_route, only: %i[new]
  before_action :find_route, only: %i[show edit update destroy]
  before_action :create_railway_stations_routes, only: %i[update]

  def index
    @routes = Route.all
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to route_path(@route), notice: 'Route created'
    else
      render :new, notice: 'Something went wrong'
    end
  end

  def update
    #byebug
    if @route.update(route_params)
      redirect_to @route, notice: 'Route updated'
    else
      render :edit, notice: 'Something went wrong'
    end
  end

  def destroy
    if @route.destroy
      redirect_to routes_path, notice: 'Route has been deleted'
    else
      redirect_to @route, notice: 'Something went wrong'
    end
  end

  private

  def create_railway_stations_routes
    railway_station_ids = params.dig(:route, :railway_station_ids)
    if railway_station_ids.any?
      railway_station_ids.delete('')

      railway_station_ids.each do |railway_station_id|
        byebug
        railway_station = RailwayStation.find_by(railway_station_id)

        RailwayStationsRoute.find_or_create_by(route: @route, railway_station: railway_station)
      end
    end
  end

  def initialize_route
    @route = Route.new
  end

  def find_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end
end
