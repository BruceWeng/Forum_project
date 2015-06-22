class AddPostStatus < ActiveRecord::Migration
  def change
    add_column :post, :status, :string
  end
end
