class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps null: false
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.integer :favorite_id
    end
    add_index :users, :post_id
    add_index :users, :comment_id
  end
end
