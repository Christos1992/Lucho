class SideEffect < ApplicationRecord
  has_many :side_effects_incidents
  has_many :incidents, through: :side_effects_incidents
end
