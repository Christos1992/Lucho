class SideEffect < ApplicationRecord
  has_many :side_effect_incidents
  has_many :incidents, through: :side_effect_incidents
end
