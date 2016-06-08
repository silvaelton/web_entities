class CreateEntityDirectories < ActiveRecord::Migration
  def change
    create_table :entity_directories do |t|


      t.integer   :cadastre_id, index: true
      t.string    :name
      t.string    :cpf
      t.string    :rg 
      t.date      :born
      t.integer   :born_state_id
      t.string    :born_city
      t.integer   :state_id, index: true
      t.string    :city
      t.string    :address
      t.string    :complement
      t.string    :cep
      t.string    :telephone
      t.string    :telephone_optional
      t.string    :celphone
      t.string    :email
      t.integer   :job
      t.string    :bio 
      t.date      :mandatory_start
      t.date      :mandatory_end

      t.timestamps null: false
    end
  end
end
