class NonSkiReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :non_ski_activity_id, :integer
  attribute :user_id, :integer
  attribute :review, :string
  attribute :rating, :integer

  # Direct associations

  # Indirect associations

end
