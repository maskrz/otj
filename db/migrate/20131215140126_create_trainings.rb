class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
