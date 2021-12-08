class AddFriendSenderReferenceToFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friends, :users, column: :friend_sender_id
    add_index :friends, :friend_sender_id
    change_column_null :friends, :friend_sender_id, false
  end
end
