class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
