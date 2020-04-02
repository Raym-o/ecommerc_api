class AddAbbrToProvinces < ActiveRecord::Migration[6.0]
  def change
    add_column :provinces, :abbr, :string
  end
end
