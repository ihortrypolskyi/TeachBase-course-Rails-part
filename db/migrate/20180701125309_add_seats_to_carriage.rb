class AddSeatsToCarriage < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :side_lower_seats, :integer
    add_column :carriages, :side_upper_seats, :integer
    add_column :carriages, :chair_seats, :integer
  end
end
