class ChangeOwnerToShelter < ActiveRecord::Migration[7.0]
  def change
    add_reference :shelters, :ongs, foreign_key: true
  end
end
