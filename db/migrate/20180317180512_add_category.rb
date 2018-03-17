class AddCategory < ActiveRecord::Migration[5.1]
  def self.up
    Category.create{:name => "All"}
    Category.create{:name => "Fine Art"}
    Category.create{:name => "Digital Art"}
    Category.create{:name => "3D"}
   end

  def self.down
  end
end
