class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :surname
      t.date :birth
      t.string :email
      t.string :password
      t.integer :state
      t.integer :privacy

      t.timestamps
    end
  end
end
