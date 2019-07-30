class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :place_name
      t.string :place_type
      t.string :place_details
      t.string :phone_number

      t.timestamps
    end
  end
end
