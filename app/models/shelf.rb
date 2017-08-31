class Shelf < ApplicationRecord

  belongs_to :location
  has_many :segments, -> { order(:identifier) }, dependent: :destroy

  validates :identifier, presence: true, numericality: {greater_than: 0, only_integer: true}, uniqueness: {scope: :location}
  validates :location, presence: true

  def first_segment_display_name
    segments.first&.interval_begin_display_name
  end

  def last_segment_display_name
    segments.last&.interval_end_display_name
  end

  def total_width
    segments.map(&:total_width).sum
  end

  def utilized_width
    segments.map(&:utilized_width).sum
  end

end
