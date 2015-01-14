class AddResponsibleNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :responsible_name, :string, after: :address
  end
end
