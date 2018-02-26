class AddContentToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :content, :text
  end
end
