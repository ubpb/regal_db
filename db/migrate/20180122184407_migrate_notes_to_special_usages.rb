class MigrateNotesToSpecialUsages < ActiveRecord::Migration[5.1]
  def up
    Segment.all.each do |segment|
      case segment.notes
      when "UEBERFORMATE"
        segment.special_usage = "Überformate"
        segment.notes = nil
      when "SEMINARAPPARATE"
        segment.special_usage = "Seminarapparate"
        segment.notes = nil
      when "NEUERWERBUNGEN", "NEUERWERBUNGEN / UEBERFORMATE"
        segment.special_usage = "Neuerwerbungen"
        segment.notes = nil
      when "LAUFENDE ZS"
        segment.special_usage = "Laufende Zeitschriften"
        segment.notes = nil
      end

      segment.save!
    end
  end
end
