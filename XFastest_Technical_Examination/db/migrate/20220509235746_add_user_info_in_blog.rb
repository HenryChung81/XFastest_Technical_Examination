class AddUserInfoInBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :is_admin, :boolean, null: false, default: false
    add_column :blogs, :is_blog_manager, :boolean, null: false, default: false
  end
end
