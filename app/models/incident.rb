class Incident < ApplicationRecord
  belongs_to :parent
<
  has_one :child, through: :parent 
  has_many :child_medications, through: :child
end

  has_many :side_effects_incidents
  has_many :side_effects, through: :side_effects_incidents
end

