class RecipesController < ApplicationController
  def index
    @recipes = find_recipes(params[:query])
  end

  private

  def find_recipes(query)
    recipes = query.present? ? Recipe.by_ingredients(query) : Recipe.random(16)
    recipes.sort_by_ratings
    recipes.limit(16)
  end
end
