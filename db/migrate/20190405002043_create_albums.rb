class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :yr, null: false
      t.integer :band_id, null: false
      t.boolean :studio, null: false

      t.timestamps
    end
  end
end
