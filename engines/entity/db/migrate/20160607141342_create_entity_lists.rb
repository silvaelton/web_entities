class CreateEntityLists < ActiveRecord::Migration
  def change
    create_table :entity_lists do |t|
      t.integer :cadastre_id, index: true
      t.string  :name
      t.string  :description
      t.integer :color, default: 0
      t.text    :cadastre_id, array: true, default: []

      t.timestamps null: false
    end
  end
end
