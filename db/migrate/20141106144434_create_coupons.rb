class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.datetime :end_date
      t.string :barcode
      t.integer :user_id
      t.integer :customer_id
      t.integer :price
      t.integer :buy_id
      t.integer :state

      t.timestamps
    end
  end
end
