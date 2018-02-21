class RemoveCatFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :cat, :string
  end
end
