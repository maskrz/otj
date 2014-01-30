class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :length
      t.string :time
      t.string :break
      t.integer :order
      
      t.references :athlete
      t.references :training

      t.timestamps
    end
  end
end
