class Child < ApplicationRecord
  belongs_to :parent
  has_many :child_medications
end
