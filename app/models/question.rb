class Question < ApplicationRecord
  store_accessor :options

  belongs_to :category
  has_many :survey_questions
end
