class AddAttachmentsArtworkToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :artwork_file_name, :string
    add_column :albums, :artwork_content_type, :string
    add_column :albums, :artwork_file_size, :integer
    add_column :albums, :artwork_updated_at, :datetime
  end

  def self.down
    remove_column :albums, :artwork_file_name
    remove_column :albums, :artwork_content_type
    remove_column :albums, :artwork_file_size
    remove_column :albums, :artwork_updated_at
  end
end
