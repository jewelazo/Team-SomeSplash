class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :photos_count

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
