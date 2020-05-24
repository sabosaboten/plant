class CreateEventOriginals < ActiveRecord::Migration[5.0]
  def change
    create_table :event_originals do |t|
      t.references :event, foreign_key: true
      t.references :original, foreign_key: true
      t.timestamps
    end
  end
end
