class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :trainnumber
      t.string :departurestation
      t.string :terminationstation
      t.datetime :departuredate
      t.datetime :departuretime
      t.datetime :arrivaldate
      t.datetime :arrivaltime
      t.decimal :ticketprice
      t.integer :traincapacity
      t.integer :seatsleft

      t.timestamps
    end
    add_index :trains, :trainnumber, unique: true
  end
end
