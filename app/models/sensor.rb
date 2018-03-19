class Sensor < ApplicationRecord
  # Model association
  belongs_to :rebreather

  # Validations
  validates :position, :serial_number, :install_date, presence: true
end
