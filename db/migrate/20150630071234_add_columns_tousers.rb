class AddColumnsTousers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_uid, :string
    add_column :users, :token, :string
  end
end
