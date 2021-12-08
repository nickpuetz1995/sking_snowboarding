class SkiArea < ApplicationRecord
  # Direct associations

  has_many   :non_ski_activities,
             :foreign_key => "tagged_ski_area_id",
             :dependent => :destroy

  has_many   :ski_area_reviews,
             :dependent => :destroy

  has_many   :ski_check_ins,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
