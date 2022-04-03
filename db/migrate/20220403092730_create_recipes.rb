class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.integer :cook_time
      t.integer :prep_time
      t.float :ratings
      t.string :author
      t.string :image
      t.string :cuisine
      t.jsonb :ingredients

      t.timestamps
    end

    add_index :recipes, "to_tsvector('english', ingredients)", using: :gin
  end
end
