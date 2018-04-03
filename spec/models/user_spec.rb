require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end