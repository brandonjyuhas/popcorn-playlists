class CreateJoinTableUserRoom < ActiveRecord::Migration
  def change
    create_join_table :rooms, :users do |t|
      t.index [:user_id, :room_id]
      t.index [:room_id, :user_id]
    end
  end
end
