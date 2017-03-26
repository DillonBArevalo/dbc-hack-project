class RemoveReferencesInstructorFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :instructor
  end
end
