class AddDraftFunctionToDairies < ActiveRecord::Migration[5.2]
  def change
    add_column :dairies, :drafted, :boolean, null: false, default: false
    change_column_default :dairies, :published, false
  end
end
