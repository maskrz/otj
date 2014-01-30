class CreateGathletes < ActiveRecord::Migration
  def change
    create_table :gathletes do |t|
    
      t.references :group
      t.references :athlete

      t.timestamps
    end
  end
end
