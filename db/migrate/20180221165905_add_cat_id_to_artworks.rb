class AddCatIdToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :category_id, :integer
  end
end
