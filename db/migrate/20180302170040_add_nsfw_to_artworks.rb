class AddNsfwToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :nsfw, :boolean
  end
end
