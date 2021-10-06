class AddTimestampsForShelves < ActiveRecord::Migration[6.0]

  def up
    add_timestamps :shelves, null: true
  end

  def down
    remove_timestamps :shelves
  end

end
