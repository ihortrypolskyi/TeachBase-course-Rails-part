class Carriage < ApplicationRecord
  TYPES = %w(compartment_carriage econom_carriage sv_carriage chair_carriage)

  belongs_to :train

  validates :position, uniqueness: { allow_nil: true, scope: :train_id }

  before_validation :set_position

  private

  def set_position
    self.position = train.carriages.pluck(:position).max.to_i + 1
  end
end
