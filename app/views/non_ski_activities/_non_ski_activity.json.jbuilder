json.extract! non_ski_activity, :id, :description, :tagged_ski_area_id, :title,
              :address, :created_at, :updated_at
json.url non_ski_activity_url(non_ski_activity, format: :json)
