class Incident < ApplicationRecord
  belongs_to :parent
  has_one :child, through: :parent
  has_many :child_medications, through: :child

  has_many :side_effect_incidents, dependent: :destroy
  has_many :side_effects, through: :side_effect_incidents, dependent: :destroy
end

