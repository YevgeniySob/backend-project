class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :zipcode
      t.integer :report_id

      t.timestamps
    end
  end
end
