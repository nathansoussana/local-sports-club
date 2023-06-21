class CreateUserSports < ActiveRecord::Migration[7.0]
  def change
    create_table :user_sports do |t|
      t.references :sport, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :level

      t.timestamps
    end
  end
end
