class Rebreather < ApplicationRecord
    # Model association
    has_many :sensors
  
    # Validations
    validates :name, presence: true
  end
  