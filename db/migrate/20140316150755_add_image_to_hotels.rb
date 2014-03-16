class AddImageToHotels < ActiveRecord::Migration
  def self.up
    add_attachment :hotels, :image
    remove_column :hotels, :photo
  end

  def self.down
    remove_attachment :hotels, :image
    add_column :hotels, :photo, :binary
  end
end
