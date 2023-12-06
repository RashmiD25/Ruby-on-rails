class ChangeConstraintInTickets < ActiveRecord::Migration[7.0]
  def change
    # Remove the unique constraint
    remove_index :tickets, :passengerid
    # Add a non-unique index
    add_index :tickets, :passengerid

  end
end
