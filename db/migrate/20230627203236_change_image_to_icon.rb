class ChangeImageToIcon < ActiveRecord::Migration[7.0]
  def change
    rename_column :sports, :image, :icon
  end
end
