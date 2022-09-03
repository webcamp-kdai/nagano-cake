class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :portal_code, :string
  end
end
