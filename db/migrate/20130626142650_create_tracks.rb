class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :id
      t.string :name
      t.integer :album_id

      t.timestamps
    end
  end
end
