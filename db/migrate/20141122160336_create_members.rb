class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :sucursal_id
      t.integer :user_id
      t.integer :role ,:default => 0
      
      t.timestamps
    end
  end
end
