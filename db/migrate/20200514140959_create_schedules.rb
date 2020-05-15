class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :image
      t.string :plantname, null: false
      # t.index :plantname, unique: true
      t.string :frecuency, null: false
      t.string :date, null: false
      t.string :time, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
