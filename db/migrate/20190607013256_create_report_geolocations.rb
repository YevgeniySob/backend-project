class CreateReportGeolocations < ActiveRecord::Migration[5.2]
  def change
    create_table :report_geolocations do |t|
      t.string :longitude
      t.string :latitude
      t.integer :report_id

      t.timestamps
    end
  end
end
