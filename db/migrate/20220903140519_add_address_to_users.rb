class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :portal_code, :string
    add_column :users, :address, :string
    add_column :users, :telephone_number, :string

    add_column :users, :is_deleted, :boolean , null: false, default: false
    add_column :users, :created_at, :datetime , null: false, default: -> {"now()"}
    add_column :users, :updated_at, :datetime , null: false, default: -> {"now()"}
  end
end
