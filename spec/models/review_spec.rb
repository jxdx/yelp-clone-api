require 'rails_helper'

RSpec.describe Review, type: :model do
  # Validation tests
  it { should validate_presence_of(:review_id) }
  it { should validate_presence_of(:business_id) }
  it { should validate_presence_of(:user_id) }
end
