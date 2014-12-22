class CreateUserRoomQueue < ActiveRecord::Migration
  def change
    create_table :user_room_queues do |t|
      t.references :userroom, index: true
    end
  end
end
