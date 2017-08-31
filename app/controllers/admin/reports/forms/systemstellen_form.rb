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
  validate -> do
    if start_interval.present? && end_interval.present? && end_interval < start_interval
      errors.add(:end_interval, "Muss lexikografisch größer oder gleich dem start Interval sein")
    end
  end

  def persisted?
    false
  end

end
