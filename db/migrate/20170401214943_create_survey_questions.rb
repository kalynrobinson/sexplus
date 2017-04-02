class CreateSurveyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_questions do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :survey, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.string :participant

      t.string :value, array: true, default: []

      t.timestamps
    end
  end
end
