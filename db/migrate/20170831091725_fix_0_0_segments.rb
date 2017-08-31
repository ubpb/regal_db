class Fix00Segments < ActiveRecord::Migration[5.1]
  def up
    Segment.where("interval_begin='0-0' OR interval_begin='0-0'").each do |s|
      s.interval_begin = nil if s.interval_begin == "0-0"
      s.interval_end = nil   if s.interval_end == "0-0"
      s.save!
    end
  end
end
