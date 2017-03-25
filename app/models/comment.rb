class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :user, required: false
  belongs_to :instructor, required: false
end
