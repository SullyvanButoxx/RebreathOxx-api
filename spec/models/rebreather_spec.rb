require 'rails_helper'

RSpec.describe Rebreather, type: :model do
  # Validation tests
  # ensure columns name and created_by are present before saving
  it { should validate_presence_of(:name) }
end
