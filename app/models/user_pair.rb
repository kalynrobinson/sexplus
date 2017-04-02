class UserPair < ApplicationRecord
  belongs_to :user1, class_name: 'User', optional: true
  belongs_to :user2, class_name: 'User', optional: true
  belongs_to :survey, optional: true
end
