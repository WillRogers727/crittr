class RemoveCatFromArtworks < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :cat, :string
  end
end
