# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def survey_email_preview
    SurveyMailer.survey_email('text@example.com', Survey.last.token)
  end

  def survey_completed_email_preview
    SurveyMailer.survey_completed_email('text@example.com', Survey.last.token)
  end
end
