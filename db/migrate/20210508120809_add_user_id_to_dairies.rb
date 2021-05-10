class AddUserIdToDairies < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM dairies;'
    add_reference :dairies, :user, null: false, index: true
  end

  def down
    remove_reference :dairies, :user, index: true
  end
end
