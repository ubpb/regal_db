class AddSpeacialUsageFieldToSegments < ActiveRecord::Migration[5.1]
  def change
    add_column :segments, :special_usage, :string, null: true, index: true
  end
end
