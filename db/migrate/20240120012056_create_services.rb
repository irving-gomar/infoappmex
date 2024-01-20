class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.date :date_from
      t.date :date_to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
