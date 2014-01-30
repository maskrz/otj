class ChangeOrderColumnName < ActiveRecord::Migration
  def change
    rename_column :sections, :order, :sequence
  end
end
