class SkiAreaReview < ApplicationRecord
  # Direct associations

  belongs_to :ski_area

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
