class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :telp
      t.string :website
      t.string :logo
      t.bigint :fk_accountmanager_id

      t.timestamps
    end
  end
end
