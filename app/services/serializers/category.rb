module Serializers
  class Category
    def self.index(categories)
      categories.map do |category|
        {
          name: category.name
        }
      end
    end
  end
end
