class SkiAreaReview < ApplicationRecord
  # Direct associations

  belongs_to :ski_area

  belongs_to :user

  # Indirect associations

  has_one    :friends_sent,
             :through => :user,
             :source => :friends_sent

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
