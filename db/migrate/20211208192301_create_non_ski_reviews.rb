class CreateNonSkiReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :non_ski_reviews do |t|
      t.integer :non_ski_activity_id
      t.integer :user_id
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
