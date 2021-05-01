class ChangeDairiesContentAndPublishedNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :dairies, :content, false
  end
end
