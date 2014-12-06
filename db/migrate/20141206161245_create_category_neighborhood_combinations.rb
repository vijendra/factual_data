class CreateCategoryNeighborhoodCombinations < ActiveRecord::Migration
  def change
    create_table :category_neighborhood_combinations do |t|
      t.string   :category
      t.string   :neighborhood
      t.integer  :result_count
      
      t.timestamps
    end
  end
end
