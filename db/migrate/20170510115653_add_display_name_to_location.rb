class AddDisplayNameToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :display_name, :string
  end
end
