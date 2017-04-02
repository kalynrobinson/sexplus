class SurveyQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :survey, optional: true
  belongs_to :category

  accepts_nested_attributes_for :survey

  attr_accessor :status

  scope :granular, -> (granular) { joins('INNER JOIN questions ON questions.id = survey_questions.question_id').where("parent_id IS NULL") unless granular }
end
