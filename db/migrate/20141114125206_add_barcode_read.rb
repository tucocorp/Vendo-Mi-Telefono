class AddBarcodeRead < ActiveRecord::Migration
  def change
    add_column :coupons, :barcode_read, :string
  end
end
