class SearchParameterSafe < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :target
  belongs_to :field
end
