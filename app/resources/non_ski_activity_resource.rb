class NonSkiActivityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :tagged_ski_area_id, :integer
  attribute :title, :string
  attribute :address, :string

  # Direct associations

  has_many   :non_ski_reviews

  belongs_to :tagged_ski_area,
             resource: SkiAreaResource

  # Indirect associations
end
