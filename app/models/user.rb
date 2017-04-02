class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name,  presence: true, length: { maximum: 50 },
    uniqueness: { case_sensitive: false }

  has_many :user_pairs, foreign_key: 'user1_id'
  # has_many :user_pairs, foreign_key: 'user2_id'

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
