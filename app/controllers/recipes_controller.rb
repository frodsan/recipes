class RecipesController < ApplicationController
  def index
    @recipes = find_recipes(params[:query])
  end

  private

  def find_recipes(query)
    if query.present?
      Recipe.by_any_of_ingredients(query).limit(16)
    else
      Recipe.random(16)
    end
  end
end
