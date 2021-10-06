class AddTimestampsForSegments < ActiveRecord::Migration[6.0]
  def up
    add_timestamps :segments, null: true
  end

  def down
    remove_timestamps :segments
  end
end
