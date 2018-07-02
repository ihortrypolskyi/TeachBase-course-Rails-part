class SvCarriage < Carriage
  SEAT_TYPES = %w(lower_seats)

  validates :lower_seats, presence: true
end
