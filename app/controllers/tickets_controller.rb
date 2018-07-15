class TicketsController < ApplicationController
  def search
    if params[:departure_station] && params[:arrival_station]
      @departure_station = RailwayStation.find_by_id(params[:departure_station])
      @arrival_station = RailwayStation.find_by_id(params[:arrival_station])

      route_ids = RailwayStationsRoute.where(railway_station_id: [@arrival_station&.id, @departure_station&.id]).distinct.pluck(:route_id)
      @trains = Train.where(route_id: route_ids)

      #rsrs = RailwayStationsRoute.where(railway_station_id: [@arrival_station&.id, @departure_station&.id]).distinct
      #rsrs.pluck(:id) == [@arrival_station&.id,  @departure_station&.id] ? rsrs : []
      #rsrs = route.railway_stations_routes.where(railway_station_id: [arrival_station_id, departure_station_id])
    end
  end

  private

  def search_params
    params.permit(:departure_station, :arrival_station, :commit )
  end
end
