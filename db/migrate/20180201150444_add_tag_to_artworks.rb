class AddTagToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :tag, :string
  end
end
