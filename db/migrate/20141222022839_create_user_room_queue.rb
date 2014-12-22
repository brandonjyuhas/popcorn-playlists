class CreateUserRoomQueue < ActiveRecord::Migration
  def change
    create_table :rooms_users_queues do |t|
      t.references :rooms_uses, index: true
    end
  end
end
