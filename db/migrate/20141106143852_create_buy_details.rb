class CreateBuyDetails < ActiveRecord::Migration
  def change
    create_table :buy_details do |t|
      t.integer :model_id
      t.integer :buy_id
      t.integer :state_id
      t.integer :imei
      t.integer :price

      t.timestamps
    end
  end
end
