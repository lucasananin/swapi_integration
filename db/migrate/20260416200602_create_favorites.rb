class CreateFavorites < ActiveRecord::Migration[8.1]
  def change
    create_table :favorites do |t|
      t.integer :person_id
      t.string :name

      t.timestamps
    end
  end
end
