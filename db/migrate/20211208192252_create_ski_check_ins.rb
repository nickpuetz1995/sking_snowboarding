class CreateSkiCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :ski_check_ins do |t|
      t.integer :user_id
      t.integer :ski_area_id

      t.timestamps
    end
  end
end
