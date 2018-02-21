class RemoveColumnFromPosts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :—force, :string
  end
end
