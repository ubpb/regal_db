class Shelf < ApplicationRecord

  belongs_to :location
  has_many :segments, -> { order(:identifier) }, dependent: :destroy

  validates :identifier, presence: true, numericality: {greater_than: 0, only_integer: true}, uniqueness: {scope: :location}
  validates :location, presence: true

  def interval_begin
    self.segments.first&.interval_begin
  end

  def interval_end
    self.segments.last&.interval_end
  end

  def total_width
    segments.map(&:total_width).sum
  end

  def utilized_width
    segments.map(&:utilized_width).sum
  end

end
