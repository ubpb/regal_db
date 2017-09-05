class AddNotesToSegment < ActiveRecord::Migration[5.1]
  def change
    add_column :segments, :notes, :text, null: true
  end
end
