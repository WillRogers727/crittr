class AddCompletedToArtwork < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :completed, :boolean
  end
end
