class CreateSkiAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :ski_areas do |t|
      t.string :name
      t.string :forecast
      t.string :snow_last_night
      t.string :address

      t.timestamps
    end
  end
end
