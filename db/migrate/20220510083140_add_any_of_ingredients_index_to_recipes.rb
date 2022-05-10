class AddAnyOfIngredientsIndexToRecipes < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :recipes,
      "to_tsvector('english', COALESCE(ingredients::text, ''))",
      name: "idx_recipes_on_any_of_ingredients",
      using: :gin,
      algorithm: :concurrently
  end
end
