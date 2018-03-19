require 'rails_helper'

RSpec.describe Sensor, type: :model do
  # Association test
  # ensure an sensor record belongs to a single rebreather record
  it { should belong_to(:rebreather) }
  # Validation test
  # ensure column position is present before saving
  it { should validate_presence_of(:position) }
  # ensure column serial number is present before saving
  it { should validate_presence_of(:serial_number) }
  # ensure column install date is present before saving
  it { should validate_presence_of(:install_date) }
end
