class AddNoteImgToNote < ActiveRecord::Migration[5.1]
  def self.up
    change_table :notes do |t|
      t.attachment :noteImg
    end
  end

  def self.down

  end
end
