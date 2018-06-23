class AddRouteIdAndCurrentStationIdToTrains < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :trains, :route
    add_belongs_to :trains, :current_station
  end
end
