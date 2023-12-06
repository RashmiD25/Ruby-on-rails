class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :phone
      t.string :address
      t.string :creditnumber

      t.timestamps
    end
    add_index :admins, :username, unique: true
    add_index :admins, :phone, unique: true
    add_index :admins, :creditnumber, unique: true
  end
end
