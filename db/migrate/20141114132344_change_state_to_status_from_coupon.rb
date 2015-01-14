class ChangeStateToStatusFromCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :status, :integer, :default => 0, after: :buy_id 
    remove_column :coupons, :state
  end
end
