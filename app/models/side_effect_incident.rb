class SideEffectIncident < ApplicationRecord
  belongs_to :incident
  has_many :side_effects
end
