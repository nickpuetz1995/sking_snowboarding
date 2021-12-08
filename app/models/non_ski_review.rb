class NonSkiReview < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    non_ski_activity.to_s
  end

end
