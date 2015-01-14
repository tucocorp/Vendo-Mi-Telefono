class ChengeColumUserPosition < ActiveRecord::Migration
  def change
    change_column :users, :position, :integer, :default => 0 
  end
end
