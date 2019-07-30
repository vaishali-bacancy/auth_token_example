class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :state , index: true, foreign_key: true
      t.string :area_name
      t.string :road_name
      t.string :landmark
      t.string :city_name
      t.string :remarks
      t.integer :pincode

      t.timestamps
    end
  end
end
