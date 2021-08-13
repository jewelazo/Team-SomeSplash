class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.integer :comments_count

      t.timestamps
    end
    add_index :photos, :title, unique: true
  end
end
