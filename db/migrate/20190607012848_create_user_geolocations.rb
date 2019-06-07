class CreateUserGeolocations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_geolocations do |t|
      t.string :longitude
      t.string :latitude
      t.integer :user_id

      t.timestamps
    end
  end
end
