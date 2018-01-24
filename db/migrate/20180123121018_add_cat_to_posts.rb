class AddCatToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :cat, :string
  end
end
