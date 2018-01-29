class AddArtworkTokenToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :artwork_token, :string
  end
end
