require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:business_id) }

  # Relationships
  it { should have_many(:categories).through(:restaurant_categories) }
end
