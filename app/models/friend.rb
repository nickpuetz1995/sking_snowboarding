class Friend < ApplicationRecord
  # Direct associations

  belongs_to :friend_recipient,
             :class_name => "User"

  belongs_to :friend_sender,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    friend_sender.to_s
  end

end
