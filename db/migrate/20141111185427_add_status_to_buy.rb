class AddStatusToBuy < ActiveRecord::Migration
  def change
    add_column :buys, :status, :integer, :default => 0, after: :customer_id
  end
end
