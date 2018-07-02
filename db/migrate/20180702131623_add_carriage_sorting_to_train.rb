class AddCarriageSortingToTrain < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :carriage_sorting, :boolean
  end
end
