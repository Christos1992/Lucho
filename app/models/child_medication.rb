class ChildMedication < ApplicationRecord
  belongs_to :child
  belongs_to :medication
end
