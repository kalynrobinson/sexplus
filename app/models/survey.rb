class Survey < ApplicationRecord
  has_secure_token

  has_one :user_pair, dependent: :destroy
  has_many :users, through: :userpair, class_name: 'UserPair'
  has_many :survey_questions
  
  accepts_nested_attributes_for :user_pair, :survey_questions
end
