class FixLocationClosedStack < ActiveRecord::Migration[5.1]
  def change
    Location.where(closed_stack: nil).update_all(closed_stack: false)

    change_column_null :locations, :closed_stack, false
    change_column_default :locations, :closed_stack, false
  end
end
