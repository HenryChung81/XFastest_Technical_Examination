class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :status, default: 'private'
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :articles, :deleted_at
  end
end
