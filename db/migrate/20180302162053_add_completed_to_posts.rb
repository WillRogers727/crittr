class AddCompletedToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :completed, :boolean
  end
end
