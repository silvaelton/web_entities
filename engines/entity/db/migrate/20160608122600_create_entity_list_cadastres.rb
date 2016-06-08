class CreateEntityListCadastres < ActiveRecord::Migration
  def change
    create_table :entity_list_cadastres do |t|
      t.integer :cadastre_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
