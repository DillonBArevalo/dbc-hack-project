class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :instructor
end
