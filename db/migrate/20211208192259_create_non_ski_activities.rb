class CreateNonSkiActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :non_ski_activities do |t|
      t.string :description
      t.integer :tagged_ski_area_id
      t.string :title
      t.string :address

      t.timestamps
    end
  end
end
