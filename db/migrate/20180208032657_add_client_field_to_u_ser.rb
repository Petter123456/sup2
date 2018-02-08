class AddClientFieldToUSer < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company, :string
    add_column :users, :company_number, :string
    add_column :users, :telephone_number, :string
  end
end
