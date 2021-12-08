class CreateSkiAreaReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :ski_area_reviews do |t|
      t.integer :user_id
      t.integer :ski_area_id
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
