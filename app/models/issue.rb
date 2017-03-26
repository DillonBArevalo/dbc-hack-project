class Issue < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :group, through: :user
end
