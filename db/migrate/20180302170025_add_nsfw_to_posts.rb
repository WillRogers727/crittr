class AddNsfwToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :nsfw, :boolean
  end
end
