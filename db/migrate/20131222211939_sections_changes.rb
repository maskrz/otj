class SectionsChanges < ActiveRecord::Migration
  def change
    rename_column :sections, :athlete_id, :atraining_id
    remove_column :sections, :training_id
  end
end
