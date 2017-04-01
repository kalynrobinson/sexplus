class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /(.+@.+\..+)|()/
  validates :name,  presence: true, length: { maximum: 50 },
    uniqueness: { case_sensitive: false }

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
