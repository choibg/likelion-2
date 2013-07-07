class CreateSnuphones < ActiveRecord::Migration
  def change
    create_table :snuphones do |t|
      t.string :address
      t.timestamps
    end
  end
end
