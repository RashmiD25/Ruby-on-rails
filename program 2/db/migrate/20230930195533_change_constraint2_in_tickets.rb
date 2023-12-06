class ChangeConstraint2InTickets < ActiveRecord::Migration[7.0]
  def change

    remove_index :tickets, :trainid
    
    add_index :tickets, :trainid

    remove_index :reviews, :passengerid
    add_index :reviews, :passengerid

    remove_index :reviews, :trainid
    add_index :reviews, :trainid
  end
end
