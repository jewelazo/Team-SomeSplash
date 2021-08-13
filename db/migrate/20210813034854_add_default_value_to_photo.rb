class AddDefaultValueToPhoto < ActiveRecord::Migration[6.1]
  def change
    change_column_default :photos, :comments_count, from: nil, to: 0
  end
end
