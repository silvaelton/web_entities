class CreateEntityMembers < ActiveRecord::Migration
  def change
    create_table :entity_members do |t|

      t.integer   :cadastre_id, index: true
      t.string    :name
      t.string    :cpf
      t.string    :rg
      t.string    :cep
      t.string    :city
      t.integer   :state_id
      t.string    :address
      t.string    :complement
      t.string    :telephone
      t.string    :telephone_optional
      t.string    :celphone
      t.string    :email
      t.string    :email_optional
      t.date      :born
      t.integer   :born_state_id
      t.string    :born_city
      t.string    :cid
      t.string    :nis
      t.string    :special_condition_flag
      t.string    :special_condition
      t.string    :income
      t.string    :work_city
      t.string    :work_state_id 
      t.string    :work_address
      t.string    :work_complement
      t.string    :work_telephone
      t.string    :work_telephone_optional
      t.integer   :situation, default: 0
      t.timestamps null: false
    end
  end
end
