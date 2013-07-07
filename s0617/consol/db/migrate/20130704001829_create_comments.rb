class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :username
      t.string :content

      t.timestamps
    end
  end
end
