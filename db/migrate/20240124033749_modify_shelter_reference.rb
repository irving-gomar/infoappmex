class ModifyShelterReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :shelters, :user, index: true, foreign_key: true
    add_reference :shelters, :ong, null: false, foreign_key: true
  end
end
