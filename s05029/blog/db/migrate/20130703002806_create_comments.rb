class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, :null =>false
      t.string :username
      t.string :content
      t.integer :like_cnt

      t.timestamps
    end
  end
end
