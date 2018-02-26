class RemovePostIdFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :post_id, :integer
  end
end
