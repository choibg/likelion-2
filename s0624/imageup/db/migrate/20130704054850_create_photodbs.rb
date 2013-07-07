class CreatePhotodbs < ActiveRecord::Migration
  def change
    create_table :photodbs do |t|
      t.binary :image 
      t.string :filename 

      t.timestamps
    end
  end
end
