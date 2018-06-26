class Incident < ApplicationRecord
  belongs_to :parent
  has_one :child, through: :parent 
  has_many :child_medications, through: :child
end