class CreateOngs < ActiveRecord::Migration[7.0]
  def change
    create_table :ongs do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
