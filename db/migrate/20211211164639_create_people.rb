class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.bigint :fk_organization_id
      t.foreign_key :organizations, column: :fk_organization_id
      t.timestamps
    end
  end
end
