class RemoveImagesFromArtworks < ActiveRecord::Migration[5.1]
  def change
  	remove_column :artworks, :image_file_name
  	remove_column :artworks, :image_content_type
  	remove_column :artworks, :image_file_size
  	remove_column :artworks, :image_updated_at
  end
end
