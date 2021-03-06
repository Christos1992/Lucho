  class Incident < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_medicaiton,
    against: [ :medication_name ],
    :associated_against => {
       side_effects: [ :name , :metric]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  belongs_to :parent
  has_one :child, through: :parent
  has_many :child_medications, through: :child


  has_many :side_effect_incidents, dependent: :destroy
  has_many :side_effects, through: :side_effect_incidents, dependent: :destroy

end

