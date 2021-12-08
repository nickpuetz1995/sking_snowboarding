class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :ski_check_ins

  has_many   :friends_received,
             resource: FriendResource,
             foreign_key: :friend_recipient_id

  has_many   :friends_sent,
             resource: FriendResource,
             foreign_key: :friend_sender_id

  # Indirect associations

end
