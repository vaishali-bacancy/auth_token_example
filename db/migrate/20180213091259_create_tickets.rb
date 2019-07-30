class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :ticket_type
      t.float :ticket_price
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
