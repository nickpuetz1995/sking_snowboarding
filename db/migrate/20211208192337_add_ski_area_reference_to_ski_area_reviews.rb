class AddSkiAreaReferenceToSkiAreaReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ski_area_reviews, :ski_areas
    add_index :ski_area_reviews, :ski_area_id
    change_column_null :ski_area_reviews, :ski_area_id, false
  end
end
