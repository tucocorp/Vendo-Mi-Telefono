class FixCustomers < ActiveRecord::Migration
  def change
    rename_column :customers , :las_name , :last_name
  end
end
