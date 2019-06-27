class RemovoveColumnIngredients < ActiveRecord::Migration
  def change 
    remove_column(:recipes,:ingrediants)
  end
end
