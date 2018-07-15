class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  has_many :carriages, -> (train) { order("number #{train.carriage_sorting ? 'ASC' : 'DESC'}") }, dependent: :destroy
  has_many :compartment_carriages
  has_many :econom_carriages
  has_many :sv_carriages
  has_many :chair_carriages

  has_many :tickets

  def rsrs_by_arrival_and_departure(arrival_station_id, departure_station_id)
    #[arrival_station, departure_station].map{ |station_id| route.railway_stations_routes}
    rsrs = route.railway_stations_routes.where(railway_station_id: [arrival_station_id, departure_station_id])
    rsrs.pluck(:id) == [arrival_station_id, departure_station_id] ? rsrs : []


  end

  def carriages_info(carriage_type, seats_type)
    carriages.where(type: carriage_type.camelize).sum(seats_type)
  end
end
