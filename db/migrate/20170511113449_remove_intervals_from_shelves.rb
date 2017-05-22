class RemoveIntervalsFromShelves < ActiveRecord::Migration[5.0]
  def change
    remove_column :shelves, :interval_begin
    remove_column :shelves, :interval_end
  end
end
