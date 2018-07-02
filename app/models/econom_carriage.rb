class EconomCarriage < Carriage
  SEAT_TYPES = %w(lower_seats upper_seats side_lower_seats side_upper_seats)

  validates :lower_seats, :upper_seats, :side_lower_seats, :side_upper_seats, presence: true
end
