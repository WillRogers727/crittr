class RemoveTokenFromArtworkss < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :token, :integer
  end
end
