class RemoveTagFromArtworks < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :tag, :string
  end
end
