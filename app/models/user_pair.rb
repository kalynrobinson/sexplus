class UserPair < ApplicationRecord
  belongs_to :user1, class_name: 'User', primary_key: 'user1_id', optional: true
  belongs_to :user2, class_name: 'User', primary_key: 'user2_id', optional: true
  belongs_to :survey, optional: true
end
