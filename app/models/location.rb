class Location < ApplicationRecord

  has_many :shelves, -> { order(:identifier) }, dependent: :destroy

  validates :identifier, presence: true, numericality: {greater_than: 0, only_integer: true}, uniqueness: true

end
