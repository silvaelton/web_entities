class AddNumberCadastreToMember < ActiveRecord::Migration
  def change
    add_column :entity_members, :number_cadastre, :string
    add_column :entity_members, :marriage_status, :string
    add_column :entity_members, :dependents_number, :string
    add_column :entity_members, :special_dependents_number, :string
    
    add_column :entity_members, :spouse_rg, :string
    add_column :entity_members, :spouse_cpf, :string
    add_column :entity_members, :spouse_name, :string
    
    add_column :entity_members, :income_family, :string
    add_column :entity_members, :income, :string
    add_column :entity_members, :typology, :string
    add_column :entity_members, :date, :date

  end
end
