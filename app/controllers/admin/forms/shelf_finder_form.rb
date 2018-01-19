class Admin::Forms::ShelfFinderForm
  include Virtus.model(nullify_blank: true)

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :search_string, String
  attribute :include_closed_stack, Boolean

  validates :search_string, presence: true

  def persisted?
    false
  end

end
