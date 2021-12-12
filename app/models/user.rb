class User < ApplicationRecord
    has_secure_password
    has_many :organization, foreign_key: 'fk_accountmanager_id', primary_key: 'id'
end
