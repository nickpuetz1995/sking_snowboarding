class NonSkiReview < ApplicationRecord
  # Direct associations

  belongs_to :non_ski_activity

  belongs_to :user

  # Indirect associations

  has_one    :friends_sent,
             :through => :user,
             :source => :friends_sent

  # Validations

  # Scopes

  def to_s
    non_ski_activity.to_s
  end

end
