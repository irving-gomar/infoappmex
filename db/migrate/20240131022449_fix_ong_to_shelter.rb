class FixOngToShelter < ActiveRecord::Migration[7.0]
  def change
    remove_reference :shelters, :ongs, foreign_key: true
    add_reference :shelters, :ong, foreign_key: true
  end
end
