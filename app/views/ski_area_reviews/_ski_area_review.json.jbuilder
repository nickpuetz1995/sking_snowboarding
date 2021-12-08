json.extract! ski_area_review, :id, :user_id, :ski_area_id, :review, :rating, :created_at, :updated_at
json.url ski_area_review_url(ski_area_review, format: :json)
