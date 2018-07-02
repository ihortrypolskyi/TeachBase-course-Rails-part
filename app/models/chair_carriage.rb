class ChairCarriage < Carriage
  SEAT_TYPES = %w(chair_seats)

  validates :chair_seats, presence: true
end
