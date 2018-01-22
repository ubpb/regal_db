class Location < ApplicationRecord

  has_many :shelves, -> { order(:identifier) }, dependent: :destroy

  validates :identifier,
    presence: true,
    numericality: {greater_than: 0, only_integer: true},
    uniqueness: true

  validates :display_name,
    presence: true

  validates :collection_codes,
    format: { with: /\A([0-9]{2})(,{0,1}[0-9]{2})*\Z/ },
    allow_blank: true

  def to_s
    display_name
  end

end
