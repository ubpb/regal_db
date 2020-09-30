class Admin::Reports::Forms::SystemstellenForm
  include Virtus.model(nullify_blank: true)

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :interval_begin, String
  attribute :interval_end, String
  attribute :include_closed_stack, Boolean

  validates :interval_begin, presence: true
  validates :interval_end, presence: true
  validate -> do
    if interval_begin.present? && interval_end.present? && interval_end < interval_begin
      errors.add(:interval_end, "Muss lexikografisch größer oder gleich der Startsystemstelle sein")
    end
  end

  def persisted?
    false
  end

end
