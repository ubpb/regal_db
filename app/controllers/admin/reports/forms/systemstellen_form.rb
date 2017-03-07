class Admin::Reports::Forms::SystemstellenForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :start_interval, Integer
  attribute :end_interval, Integer

  validates :start_interval, presence: true
  validates :end_interval, presence: true

  def persisted?
    false
  end

end
