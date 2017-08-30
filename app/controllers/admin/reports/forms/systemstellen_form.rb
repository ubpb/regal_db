class Admin::Reports::Forms::SystemstellenForm
  include Virtus.model(nullify_blank: true)

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :start_interval, Integer
  attribute :end_interval, Integer
  attribute :ignore_closed_stack, Boolean

  validates :start_interval, presence: true
  validates :end_interval, presence: true

  def persisted?
    false
  end

end
