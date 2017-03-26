class DropInstructors < ActiveRecord::Migration[5.0]
  def change
    drop_table :instructors
  end
end
