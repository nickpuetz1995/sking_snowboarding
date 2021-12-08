class AddSkiAreaReferenceToSkiCheckIns < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ski_check_ins, :ski_areas
    add_index :ski_check_ins, :ski_area_id
    change_column_null :ski_check_ins, :ski_area_id, false
  end
end
