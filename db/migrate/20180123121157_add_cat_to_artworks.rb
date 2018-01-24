class AddCatToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :cat, :string
  end
end
