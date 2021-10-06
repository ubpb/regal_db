class Segment < ApplicationRecord

  SHELF_WIDTHS = [50, 70, 75, 90, 100, 120]
  NO_OF_LEVELS = 1..10
  SPECIAL_USAGES = ["Überformate", "Seminarapparate", "Neuerwerbungen", "Laufende Zeitschriften"]

  belongs_to :shelf, touch: true

  validates :identifier,
    presence: true,
    numericality: {greater_than: 0, only_integer: true},
    uniqueness: {scope: :shelf}

  validates :utilisation,
    presence: true,
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  validates :width,
    presence: true,
    numericality: {greater_than: 0, only_integer: true}

  validates :no_of_levels,
    presence: true,
    numericality: {greater_than: 0, only_integer: true}

  validate  -> do
    errors.add(:interval_end, I18n.t('errors.messages.blank')) if interval_begin.present? && interval_end.blank?
    errors.add(:interval_begin, I18n.t('errors.messages.blank')) if interval_begin.blank? && interval_end.present?

    errors.add(:special_usage, "Bei Sondernutzung darf keine Systemstelle vergeben werden") if special_usage.present? && (interval_begin.present? || interval_end.present?)
  end

  auto_strip_attributes :interval_begin, :interval_end, upcase: true

  def interval_begin_display_name
    interval_begin || "n.n"
  end

  def interval_end_display_name
    interval_end || "n.n"
  end

  def total_width
    no_of_levels * width
  end

  def utilised_width
    total_width * utilisation
  end

end
