class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.references :domain, index: true, foreign_key: true
      t.string :username
      t.string :slug

      t.timestamps null: false
    end
  end
end
