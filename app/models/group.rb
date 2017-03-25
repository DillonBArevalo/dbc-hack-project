class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :issues, through: :owner
end
