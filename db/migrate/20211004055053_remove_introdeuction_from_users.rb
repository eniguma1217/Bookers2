class RemoveIntrodeuctionFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introdeuction, :string
  end
end
