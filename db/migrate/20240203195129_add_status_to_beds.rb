class AddStatusToBeds < ActiveRecord::Migration[7.0]
  def change
    add_column :beds, :status, :integer, default: 0
  end
end
