class AddPositionToCarriage < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :position, :integer
    add_index :carriages, :position
  end
end
