class SkiAreaReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :ski_area_id, :integer
  attribute :review, :string
  attribute :rating, :integer

  # Direct associations

  # Indirect associations

end
