class ChangeCategoryColumnType < ActiveRecord::Migration
  def change
    remove_column :category_neighborhood_combinations, :category
    add_column :category_neighborhood_combinations, :category, :text 
  end
end
