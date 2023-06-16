class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :sport, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :level
      t.date :date
      t.integer :participant_number
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
