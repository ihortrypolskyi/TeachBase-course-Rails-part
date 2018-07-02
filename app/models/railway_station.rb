class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains, inverse_of: :current_station, foreign_key: :current_station_id

  scope :ordered_by_position, -> { includes(:railway_stations_routes).order('railway_stations_routes.position') }
end
