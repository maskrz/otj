class RenameTrainingType < ActiveRecord::Migration
  def change
    rename_column :trainings, :type, :training_type
  end
end
