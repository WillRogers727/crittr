class RemoveTagFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :tag, :string
  end
end
