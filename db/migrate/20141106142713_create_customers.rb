class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :las_name
      t.string :rut
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
