class CreateAtrainings < ActiveRecord::Migration
  def change
    create_table :atrainings do |t|
      t.text :comment
      
      t.references :athlete
      t.references :training

      t.timestamps
    end
  end
end
