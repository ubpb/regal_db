class Admin::Reports::Forms::RegalreihenForm
  include Virtus.model(nullify_blank: true)

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :location_id, Integer
  attribute :start_row, Integer
  attribute :end_row, Integer

  validates :location_id, presence: true
  validates :start_row, presence: true
  validates :end_row, presence: true

  def persisted?
    false
  end

end
