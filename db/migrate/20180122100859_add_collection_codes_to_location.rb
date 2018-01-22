class AddCollectionCodesToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :collection_codes, :string, null: true, index: true
  end
end
