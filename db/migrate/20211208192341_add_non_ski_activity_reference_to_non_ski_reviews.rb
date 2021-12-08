class AddNonSkiActivityReferenceToNonSkiReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :non_ski_reviews, :non_ski_activities
    add_index :non_ski_reviews, :non_ski_activity_id
    change_column_null :non_ski_reviews, :non_ski_activity_id, false
  end
end
