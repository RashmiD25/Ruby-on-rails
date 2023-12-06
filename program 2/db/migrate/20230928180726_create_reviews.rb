class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :passengerid
      t.string :trainid
      t.integer :rating
      t.string :feedback

      t.timestamps
    end
    add_index :reviews, :passengerid, unique: true
    add_index :reviews, :trainid, unique: true
  end
end
