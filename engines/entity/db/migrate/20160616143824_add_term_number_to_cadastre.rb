class AddTermNumberToCadastre < ActiveRecord::Migration
  def change
    add_column :entity_members, :term_number, :string
    add_column :entity_members, :term_date_signature, :date
  end
end
