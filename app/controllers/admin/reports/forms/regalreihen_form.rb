class Admin::Reports::Forms::RegalreihenForm
  include Virtus.model(nullify_blank: true)

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :location_id, Integer
  attribute :start_row, Integer
  attribute :end_row, Integer
  attribute :expand_segments, Boolean

  validates :location_id, presence: true
  validates :start_row, numericality: {only_integer: true, greater_than: 0, allow_blank: true}
  validates :end_row, numericality: {only_integer: true, greater_than: 0, allow_blank: true}

  def persisted?
    false
  end

end
