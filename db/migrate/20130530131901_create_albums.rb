class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.integer :id
      t.string :name
      t.integer :artist_id
      t.integer :genre_id
      t.string :cover

      t.timestamps
    end
  end
end
