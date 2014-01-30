class AddPasswordAndTrainer < ActiveRecord::Migration
  def change
    add_column :trainers, :password, :string
    add_reference :trainings, :trainer, index: true
  end
end
