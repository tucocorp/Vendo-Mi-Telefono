class CreateSucursals < ActiveRecord::Migration
  def change
    create_table :sucursals do |t|
      t.string   :name
      t.integer  :company_id
      t.string   :address
      t.integer  :contact_number
      t.string   :email
      t.string   :responsible_name
      t.timestamps
    end
  end
end
