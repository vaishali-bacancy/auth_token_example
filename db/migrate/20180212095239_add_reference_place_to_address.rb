class AddReferencePlaceToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :place, foreign_key: true
  end
end
