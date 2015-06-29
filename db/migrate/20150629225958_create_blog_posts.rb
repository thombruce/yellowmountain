class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :slug_candidate
      t.string :slug

      t.timestamps null: false
    end
    add_index :blog_posts, :title, unique: true
    add_index :blog_posts, :slug, unique: true
  end
end
