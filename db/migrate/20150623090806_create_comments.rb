class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamps null: false
      t.integer :comment_id
      t.integer :post_id
      t.integer :user_id
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
    add_column :posts, :post_id, :integer
    add_column :posts, :user_id, :integer
    add_index  :posts, :user_id
  end
end
