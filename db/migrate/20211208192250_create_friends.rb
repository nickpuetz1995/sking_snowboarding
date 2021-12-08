class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :friend_sender_id
      t.integer :friend_recipient_id

      t.timestamps
    end
  end
end
