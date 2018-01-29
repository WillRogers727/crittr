class RemoveArtworkTokenFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :artwork_token, :integer
  end
end
