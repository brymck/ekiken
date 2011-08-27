class AddCategoryToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :category_id, :integer
    add_index  :routes, :category_id
  end
end
