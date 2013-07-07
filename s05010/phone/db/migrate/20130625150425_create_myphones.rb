class CreateMyphones < ActiveRecord::Migration
  def change
    create_table :myphones do |t|
      t.string :phone_number, :null=>false 

      t.timestamps
    end
  end
end
