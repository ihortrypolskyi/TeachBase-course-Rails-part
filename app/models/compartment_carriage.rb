class CompartmentCarriage < Carriage
  SEAT_TYPES = %w(lower_seats upper_seats)

  validates :lower_seats, :upper_seats, presence: true
end
