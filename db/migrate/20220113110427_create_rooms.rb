class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :city
      t.integer :rate
      t.string :type
      t.text :amenities
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
