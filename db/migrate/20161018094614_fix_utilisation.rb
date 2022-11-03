class FixUtilisation < ActiveRecord::Migration[5.0]
  def up
    Segment.all.each do |segment|
      segment.update(utilisation: 1.0) if segment.utilisation = 0.0
    end
  end
end
