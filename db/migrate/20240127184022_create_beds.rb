class CreateBeds < ActiveRecord::Migration[7.0]
  def change
    create_table :beds do |t|

      t.timestamps
    end
  end
end
