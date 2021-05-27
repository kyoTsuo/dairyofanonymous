class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.string :title
      t.text :content, null: false
      t.boolean :published, null: false
      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
