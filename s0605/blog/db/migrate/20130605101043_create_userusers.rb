class CreateUserusers < ActiveRecord::Migration
  def change
    create_table :userusers do |t|

      t.timestamps
    end
  end
end
