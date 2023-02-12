class Target < ApplicationRecord
  has_many :program_targets, dependent: :destroy
  has_many :search_parameter_saves, dependent: :destroy
  
  has_many :programs, through: :program_targets
end
