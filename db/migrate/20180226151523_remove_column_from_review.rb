class RemoveColumnFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :review, :text
  end
end
