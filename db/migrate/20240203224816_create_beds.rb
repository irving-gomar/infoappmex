class CreateBeds < ActiveRecord::Migration[7.0]
  def change
    create_table :beds do |t|
      t.integer :status, default: 0
      t.references :shelter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
