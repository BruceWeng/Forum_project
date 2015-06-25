class AddCommentTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_time, :datetime
  end
end
