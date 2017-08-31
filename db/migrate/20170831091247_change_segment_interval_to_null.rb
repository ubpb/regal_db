class ChangeSegmentIntervalToNull < ActiveRecord::Migration[5.1]
  def up
    change_column :segments, :interval_begin, :string, null: true
    change_column :segments, :interval_end, :string, null: true
  end
end
