class CreateDairies < ActiveRecord::Migration[5.2]
  def change
    create_table :dairies do |t|
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
