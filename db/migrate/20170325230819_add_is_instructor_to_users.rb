class AddIsInstructorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_instructor, :boolean
  end
end
