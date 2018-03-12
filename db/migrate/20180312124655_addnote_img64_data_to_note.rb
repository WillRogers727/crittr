class AddnoteImg64DataToNote < ActiveRecord::Migration[5.1]
  def change
  	add_column :notes, :noteImgData, :string
  end
end
