require 'rails_helper'

RSpec.describe Category, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }

  # Relationships
  it { should have_many(:restaurants).through(:restaurant_categories) }
end
