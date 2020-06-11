class CreateOriginals < ActiveRecord::Migration[5.0]
  def change
    create_table :originals do |t|
      t.string :image, null: false
      t.string :plantname, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
