class AddGroupToTraining < ActiveRecord::Migration
  def change
    add_column :trainings, :group_id, :integer
  end
end
