class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :max_capacity
      t.references :ong, null: false, foreign_key: true

      t.timestamps
    end
  end
end
