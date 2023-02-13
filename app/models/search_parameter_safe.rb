class SearchParameterSafe < ApplicationRecord
  belongs_to :user
  belongs_to :area, optional: true
  belongs_to :target, optional: true
  belongs_to :field, optional: true

  validates :search_name, presence: true
end
