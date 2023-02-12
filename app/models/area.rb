class Area < ApplicationRecord
  has_many :program_areas, dependent: :destroy
  has_many :search_parameter_saves, dependent: :destroy

  has_many :programs, through: :program_areas
end
