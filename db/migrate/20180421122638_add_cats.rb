class AddCats < ActiveRecord::Migration[5.1]
  def up
    Category.create(id: 1, name: "All");
    Category.create(id: 2, name: "Concept Art");
    Category.create(id: 3, name: "Digital Art");
    Category.create(id: 4, name: "3D");
    Category.create(id: 5, name: "Photography");
    Category.create(id: 6, name: "Traditional Art");
    Category.create(id: 7, name: "UI Design");
    Category.create(id: 8, name: "Architecture");
    Category.create(id: 9, name: "Web Design");
    Category.create(id: 10, name: "Fan Art");
    Category.create(id: 11, name: "Typography");
  end

  def down
  end

end
