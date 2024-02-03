class AddShelterIdToBed < ActiveRecord::Migration[7.0]
  def change
    add_reference :beds, :shelter, null: false, foreign_key: true
  end
end
