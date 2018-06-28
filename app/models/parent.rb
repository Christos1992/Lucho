class Parent < ApplicationRecord
  belongs_to :user
  has_one :child
  has_many :incidents
end
