class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.date :date, null: false
      t.references :original, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
