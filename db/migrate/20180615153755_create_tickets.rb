class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :first_station
      t.belongs_to :last_station
      t.belongs_to :train
      t.belongs_to :user

      t.timestamps
    end
  end
end
