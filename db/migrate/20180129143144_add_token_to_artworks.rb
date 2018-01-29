class AddTokenToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :token, :string
  end
end
