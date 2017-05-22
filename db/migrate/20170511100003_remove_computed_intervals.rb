class RemoveComputedIntervals < ActiveRecord::Migration[5.0]
  def change
    remove_column :shelves, :interval_begin_computed
    remove_column :shelves, :interval_end_computed
    remove_column :segments, :interval_begin_computed
    remove_column :segments, :interval_end_computed
  end
end
