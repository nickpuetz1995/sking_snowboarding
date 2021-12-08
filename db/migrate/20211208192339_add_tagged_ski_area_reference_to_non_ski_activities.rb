class AddTaggedSkiAreaReferenceToNonSkiActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :non_ski_activities, :ski_areas, column: :tagged_ski_area_id
    add_index :non_ski_activities, :tagged_ski_area_id
    change_column_null :non_ski_activities, :tagged_ski_area_id, false
  end
end
