class SkiCheckInResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :ski_area_id, :integer

  # Direct associations

  belongs_to :ski_area

  belongs_to :user

  # Indirect associations

  has_one    :friends_sent,
             resource: FriendResource
end
