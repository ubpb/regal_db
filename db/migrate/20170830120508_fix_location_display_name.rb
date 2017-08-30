class FixLocationDisplayName < ActiveRecord::Migration[5.1]
  def up
    Location.all.each do |location|
      if location.display_name.blank?
        location.update_attributes(display_name: "Ebene #{location.identifier}")
      end
    end
  end
end
