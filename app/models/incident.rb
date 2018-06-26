class Incident < ApplicationRecord
  belongs_to :parent
  has_many :side_effects_incidents
  has_many :side_effects, through: :side_effects_incidents
end
