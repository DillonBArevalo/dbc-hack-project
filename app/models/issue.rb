class Issue < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_one :group, through: :user
end
