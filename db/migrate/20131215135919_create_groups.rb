class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :quantity
      
      t.references :trainer

      t.timestamps
    end
  end
end
