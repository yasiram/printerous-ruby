class AddUserRefToOrganization < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :organizations, :users, column: :fk_accountmanager_id
  end
end
