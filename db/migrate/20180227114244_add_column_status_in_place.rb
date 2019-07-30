class AddColumnStatusInPlace < ActiveRecord::Migration[5.1]
  def up
    add_column :places, :status, :integer
  end
  def down
    remove_column :places, :status, :integer
  end
end
