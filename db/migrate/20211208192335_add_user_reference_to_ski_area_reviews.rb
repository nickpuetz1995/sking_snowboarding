class AddUserReferenceToSkiAreaReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ski_area_reviews, :users
    add_index :ski_area_reviews, :user_id
    change_column_null :ski_area_reviews, :user_id, false
  end
end
