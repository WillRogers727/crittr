class DropReviewTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :reviews
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
