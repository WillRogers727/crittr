class AddReviewToArtwork < ActiveRecord::Migration[5.1]
  def self.up
    change_table :reviews do |t|
      t.references :artwork, foreign_key: true
    end
  end

  def self.down
    change_table :reviews do |t|
      t.remove :post_id
    end
  end
end
