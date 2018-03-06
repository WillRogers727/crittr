class AddCategoryAll < ActiveRecord::Migration[5.1]
  def up
  	Category.create(id: 1, name: "All");
  end

  def down
  
  end
end
