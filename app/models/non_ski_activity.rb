class NonSkiActivity < ApplicationRecord
  # Direct associations

  belongs_to :tagged_ski_area,
             :class_name => "SkiArea"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end

end
