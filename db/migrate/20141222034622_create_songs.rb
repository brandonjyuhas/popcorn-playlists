class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :rooms_users
    end
  end
end
