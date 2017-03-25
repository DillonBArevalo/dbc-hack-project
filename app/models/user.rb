class User < ApplicationRecord
  belongs_to :group, required: false
  has_one :group, foreign_key: 'owner_id'
  has_many :issues
  has_many :comments

  has_secure_password
end
