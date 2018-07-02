class CreateCarriages < ActiveRecord::Migration[6.1]
  def change
    create_table :carriages do |t|
      t.belongs_to :train
      t.string :type
      t.string :number
      t.integer :lower_seats
      t.integer :upper_seats

      t.timestamps
    end
  end
end
