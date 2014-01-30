class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :surname
      t.date :birth
      t.string :email
      t.integer :state

      t.timestamps
    end
  end
end
