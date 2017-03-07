class Shelf < ApplicationRecord

  belongs_to :location
  has_many :segments, -> { order(:identifier) }, dependent: :destroy

  validates :identifier, presence: true, numericality: {greater_than: 0, only_integer: true}, uniqueness: {scope: :location}
  validates :location, presence: true

  def recalculate_interval!
    update!({
      interval_begin: self.segments.first.interval_begin,
      interval_end: self.segments.last.interval_end
    })
  end

  before_save do
    if self.interval_begin
      self.interval_begin_computed = self.interval_begin.ljust(15, "0")
    end

    if self.interval_end
      self.interval_end_computed = self.interval_end.ljust(15, "Z")
    end
  end

  def total_width
    segments.map(&:total_width).sum
  end

  def utilized_width
    segments.map(&:utilized_width).sum
  end

end
