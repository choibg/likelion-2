class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username 
      t.string :realname 
      t.string :password_hash 
      t.integer :age 
      t.string :major
      t.string :student_number 
      t.timestamps
    end
  end
end
