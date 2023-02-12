class Field < ApplicationRecord
  has_many :program_fields, dependent: :destroy
  has_many :search_parameter_saves, dependent: :destroy
  
  has_many :programs, through: :program_fields
end
