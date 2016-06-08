class CreateEntityLists < ActiveRecord::Migration
  def change
    create_table :entity_lists do |t|
      t.string  :name
      t.text  :description
      t.integer :color, default: 0

      t.timestamps null: false
    end
  end
end
