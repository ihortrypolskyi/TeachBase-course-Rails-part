class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :position, uniqueness: { scope: :route_id, message: 'RailwayStation position for same Route is duplicated'}
end
