class GroupsRemove < ActiveRecord::Migration
  def change
    remove_column :trainings, :group_id
    drop_table :groups
    drop_table :gathletes
    add_column :athletes, :trainer_id, :integer
  end
end
