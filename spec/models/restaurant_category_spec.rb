require 'rails_helper'

RSpec.describe RestaurantCategory, type: :model do
  # Relationships
  it { should belong_to(:restaurant) }
  it { should belong_to(:category) }
end
