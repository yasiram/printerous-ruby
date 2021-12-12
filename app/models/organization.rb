class Organization < ApplicationRecord
    has_one_attached :logo
    #belongs_to :user, foreign_key: 'fk_accountmanager_id', primary_key: 'id'
    has_many :people, foreign_key: 'fk_organization_id', primary_key: 'id'
end
