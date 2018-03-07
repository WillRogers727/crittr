class AddContentToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :content, :text
  end
end
