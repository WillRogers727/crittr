class AddCats < ActiveRecord::Migration[5.1]
  def up
  	Category.create(id: 1, name: "All");
  	Category.create(id: 2, name: "Fine Art");
  	Category.create(id: 3, name: "3D");
  	Category.create(id: 4, name: "Digital Painting");
  end

  def down
  end
end
