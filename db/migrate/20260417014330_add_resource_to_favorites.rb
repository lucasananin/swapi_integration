class AddResourceToFavorites < ActiveRecord::Migration[8.1]
  def change
    add_column :favorites, :resource, :string
  end
end
