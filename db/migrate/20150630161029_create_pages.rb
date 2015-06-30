class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :slug_candidate
      t.string :slug

      t.timestamps null: false
    end
    add_index :pages, :title, unique: true
    add_index :pages, :slug, unique: true
  end
end
