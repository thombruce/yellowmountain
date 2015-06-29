class CreateVanityUrls < ActiveRecord::Migration
  def change
    create_table :vanity_urls do |t|
      t.string :slug
      t.string :target
      t.integer :owner_id
      t.string :owner_type

      t.timestamps null: false
    end
  end
end
