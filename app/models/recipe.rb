class Recipe < ApplicationRecord
  scope :sort_by_ratings, -> {
    order(ratings: :desc)
  }

  scope :random, -> (limit) {
    from(order("random()").limit(limit), :recipes)
  }

  scope :by_ingredients, -> (query) {
    where("to_tsvector('english', ingredients) @@ websearch_to_tsquery(?)", query)
  }
end
