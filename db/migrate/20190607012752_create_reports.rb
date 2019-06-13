class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.integer :votes
      t.text :image
      t.string :date
      t.string :time
      t.integer :state_id
      t.integer :user_id

      t.timestamps
    end
  end
end
