class AddDeletedAtToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :deleted_at, :datetime
    add_index :blogs, :deleted_at
  end
end
