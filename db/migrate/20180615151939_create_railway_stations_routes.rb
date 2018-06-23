class CreateRailwayStationsRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :railway_stations_routes do |t|
      t.belongs_to :railway_station
      t.belongs_to :route

      t.timestamps
    end
  end
end
  