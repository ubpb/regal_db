class Default < ActiveRecord::Migration[5.0]
  def change

    create_table :locations do |t|
      t.integer :identifier, null: false
    end

    add_index :locations, [:identifier], unique: true


    create_table :shelves do |t|
      t.belongs_to :location, foreign_key: true, index: true, null: false
      t.integer    :identifier, null: false
      t.string     :interval_begin, index: true
      t.string     :interval_end, index: true
      t.string     :interval_begin_computed, index: true
      t.string     :interval_end_computed, index: true
    end

    add_index :shelves, [:identifier, :location_id], unique: true


    create_table :segments do |t|
      t.belongs_to :shelf, foreign_key: true, index: true, null: false
      t.integer    :identifier, null: false
      t.string     :interval_begin, index: true, null: false
      t.string     :interval_end, index: true, null: false
      t.string     :interval_begin_computed, index: true, null: false
      t.string     :interval_end_computed, index: true, null: false
      t.float      :utilisation, default: 0.0, null: false
      t.integer    :width, default: 100, null: false
      t.integer    :no_of_levels
    end

    add_index :segments, [:identifier, :shelf_id], unique: true

  end
end
