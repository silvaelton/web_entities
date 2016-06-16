class AddGenderToMember < ActiveRecord::Migration
  def change
    add_column :entity_members, :civil_state, :integer
    add_column :entity_members, :professional, :string
    add_column :entity_members, :gender, :integer
  end
end
