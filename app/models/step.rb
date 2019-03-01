class Step < ApplicationRecord
  belongs_to :problem

  validates :decision, presence: true
end
