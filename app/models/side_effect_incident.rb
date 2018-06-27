class SideEffectIncident < ApplicationRecord
  belongs_to :incident
  belongs_to :side_effect


  validates :side_type, inclusion: { in: ['mild', 'sever', 'deqdly']}
end
