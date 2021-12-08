class AddUserReferenceToSkiCheckIns < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ski_check_ins, :users
    add_index :ski_check_ins, :user_id
    change_column_null :ski_check_ins, :user_id, false
  end
end
