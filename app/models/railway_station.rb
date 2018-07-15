class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, inverse_of: :current_station, foreign_key: :current_station_id

  scope :ordered_by_position, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').distinct }

  def  update_position(route, position)
    station_route(route).update(position: position) if station_route(route)
  end

  def position_at(route)
    station_route(route)&.position
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
