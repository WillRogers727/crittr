class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :picture, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
