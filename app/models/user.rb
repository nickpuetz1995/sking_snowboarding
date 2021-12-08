class User < ApplicationRecord
  # Direct associations

  has_many   :friends_sent,
             :class_name => "Friend",
             :foreign_key => "friend_sender_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
