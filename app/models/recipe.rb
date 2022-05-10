class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :by_any_of_ingredients,
                  against: :ingredients,
                  using: {
                    tsearch: {
                      any_word: true,
                      dictionary: "english"
                    }
                  },
                  order_within_rank: "recipes.ratings DESC"

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
