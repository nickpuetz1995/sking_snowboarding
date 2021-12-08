class AddFriendRecipientReferenceToFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friends, :users, column: :friend_recipient_id
    add_index :friends, :friend_recipient_id
    change_column_null :friends, :friend_recipient_id, false
  end
end
