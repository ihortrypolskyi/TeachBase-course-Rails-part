class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  has_many :carriages, -> (train) { order("number #{train.carriage_sorting ? 'ASC' : 'DESC'}") }, dependent: :destroy
  has_many :compartment_carriages
  has_many :econom_carriages
  has_many :sv_carriages
  has_many :chair_carriages

  has_many :tickets

  def carriages_info(carriage_type, seats_type)
    carriages.where(type: carriage_type.camelize).sum(seats_type)
  end
end
