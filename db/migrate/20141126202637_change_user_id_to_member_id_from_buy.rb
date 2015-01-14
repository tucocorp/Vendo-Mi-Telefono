class ChangeUserIdToMemberIdFromBuy < ActiveRecord::Migration
  def change
    rename_column :buys, :user_id, :member_id
  end
end
