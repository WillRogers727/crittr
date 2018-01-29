class AddArtworkIdToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :artwork_id, :integer
  end
end
