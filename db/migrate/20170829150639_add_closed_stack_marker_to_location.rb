class AddClosedStackMarkerToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :closed_stack, :boolean, index: true
  end
end
