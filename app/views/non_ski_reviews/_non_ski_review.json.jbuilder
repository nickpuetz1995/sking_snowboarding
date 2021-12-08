json.extract! non_ski_review, :id, :non_ski_activity_id, :user_id, :review, :rating, :created_at, :updated_at
json.url non_ski_review_url(non_ski_review, format: :json)
