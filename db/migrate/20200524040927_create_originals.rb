class CreateOriginals < ActiveRecord::Migration[5.0]
  def change
    create_table :originals do |t|
      t.string :image
      t.string :plantname
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
