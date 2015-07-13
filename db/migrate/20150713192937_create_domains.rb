class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.references :owner, polymorphic: true, index: true
      t.string :name
      t.string :extension
      t.string :slug

      t.timestamps null: false
    end
  end
end
