class People < ApplicationRecord
    has_one_attached :avatar
    has_one :organization, foreign_key: 'id', primary_key: 'fk_organization_id'
end
