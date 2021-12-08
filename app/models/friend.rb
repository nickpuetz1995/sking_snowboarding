class Friend < ApplicationRecord
  # Direct associations

  belongs_to :friend_recipient,
             :class_name => "User"

  belongs_to :friend_sender,
             :class_name => "User"

  # Indirect associations

  has_one    :ski_area_review,
             :through => :friend_sender,
             :source => :ski_area_reviews

  # Validations

  # Scopes

  def to_s
    friend_sender.to_s
  end

end
