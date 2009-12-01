class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.string :quality
      t.integer :artist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end