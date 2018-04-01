class AddRecToSupplier < ActiveRecord::Migration[5.1]
  def change
    add_column :suppliers, :recruitment_percentage, :string
  end
end
