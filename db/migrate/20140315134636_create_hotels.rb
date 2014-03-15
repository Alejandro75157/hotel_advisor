class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.boolean :breakfast_included
      t.text :room_description
      t.binary :photo
      t.integer :price_for_room

      t.timestamps
    end
  end
end
