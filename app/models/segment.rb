class Segment < ApplicationRecord

  belongs_to :shelf

  validates :identifier, presence: true, numericality: {greater_than: 0, only_integer: true}, uniqueness: {scope: :shelf}
  validates :utilisation, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}
  validates :width, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 100, only_integer: true}
  validates :no_of_levels, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10, only_integer: true}
  validates :interval_begin, presence: true
  validates :interval_end, presence: true

  auto_strip_attributes :interval_begin, :interval_end, upcase: true

  before_save do
    if self.interval_begin
      self.interval_begin_computed = self.interval_begin.ljust(15, "0")
    end

    if self.interval_end
      self.interval_end_computed = self.interval_end.ljust(15, "Z")
    end
  end

  after_save do
    self.shelf.recalculate_interval!
  end

  after_destroy do
    self.shelf.recalculate_interval!
  end


  def map_id
    "#segment-#{shelf.location.identifier}-#{shelf.identifier}-#{identifier}"
  end

  def to_s
    "Ebene #{shelf.location.identifier}: Regal #{shelf.identifier}, Segment #{identifier}"
  end

end
