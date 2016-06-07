class CreateEntityCadastres < ActiveRecord::Migration
  def change
    create_table :entity_cadastres do |t|

      t.string  :name
      t.string  :acronym
      t.string  :cnpj
      t.string  :telephone
      t.string  :telephone_optional
      t.string  :celphone
      t.string  :celphone_optional
      t.string  :email
      t.string  :email_optional
      t.integer :color, default: 0
      t.string  :cep
      t.integer :state_id, index: true
      t.string  :city
      t.string  :address
      t.string  :complement
      t.string  :number
      t.string  :burgh
      t.string  :reference_point
      t.date    :foundation_date
      t.string  :password_digest
      t.string  :token
      t.string  :last_signed_in_at 

      t.timestamps null: false
    end
  end
end
