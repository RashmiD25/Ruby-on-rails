class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :passengerid
      t.string :trainid
      t.integer :confirmationnumber

      t.timestamps
    end
    add_index :tickets, :passengerid, unique: true
    add_index :tickets, :trainid, unique: true
  end
end
