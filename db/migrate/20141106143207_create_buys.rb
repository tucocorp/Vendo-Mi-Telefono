class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.integer :user_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
