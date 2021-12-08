json.extract! ski_area, :id, :name, :forecast, :snow_last_night, :address,
              :created_at, :updated_at
json.url ski_area_url(ski_area, format: :json)
