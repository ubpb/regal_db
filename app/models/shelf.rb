class Shelf < ApplicationRecord

  belongs_to :location
  has_many :segments, -> { order(:identifier) }, dependent: :destroy

  validates :identifier,
    presence: true,
    numericality: {greater_than: 0, only_integer: true},
    uniqueness: {scope: :location}

  validates :location, presence: true

  def first_segment_display_name
    segments.first&.interval_begin_display_name
  end

  def last_segment_display_name
    segments.last&.interval_end_display_name
  end

  def total_width
    segments&.map(&:total_width).sum || 0
  end

  def utilised_width
    segments&.map(&:utilised_width).sum || 0
  end

  def utilisation
    if total_width == 0 || utilised_width == 0
      0
    else
      utilised_width / total_width * 100
    end
  end

end
