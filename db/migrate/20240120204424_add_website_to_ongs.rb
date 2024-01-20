class AddWebsiteToOngs < ActiveRecord::Migration[7.0]
  def change
    add_column :ongs, :website, :string
  end
end
