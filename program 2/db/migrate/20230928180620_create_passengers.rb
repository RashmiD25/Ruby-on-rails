class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :address
      t.string :creditnumber

      t.timestamps
    end
    add_index :passengers, :email, unique: true
    add_index :passengers, :phone, unique: true
    add_index :passengers, :creditnumber, unique: true
  end
end
