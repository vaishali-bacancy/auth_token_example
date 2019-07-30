class CreateTimings < ActiveRecord::Migration[5.1]
  def change
    create_table :timings do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
