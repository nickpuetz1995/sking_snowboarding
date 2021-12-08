class AddUserReferenceToNonSkiReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :non_ski_reviews, :users
    add_index :non_ski_reviews, :user_id
    change_column_null :non_ski_reviews, :user_id, false
  end
end
