class FriendResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :friend_sender_id, :integer
  attribute :friend_recipient_id, :integer

  # Direct associations

  belongs_to :friend_recipient,
             resource: UserResource

  belongs_to :friend_sender,
             resource: UserResource

  # Indirect associations

  has_one    :ski_check_in
  has_one    :non_ski_review
  has_one    :ski_area_review
end
