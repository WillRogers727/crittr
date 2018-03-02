class RemoveAnsweredFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :answered, :boolean
  end
end
