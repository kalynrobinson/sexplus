class SurveyMailer < ApplicationMailer
  default from: "kalynisanerd@gmail.com"

  def survey_email(email, token)
    @token = token
    mail(to: email, subject: 'Sex+ Survey Invitation')
  end

  def survey_completed_email(email, token)
    @token = token
    mail(to: email, subject: 'Sex+ Survey Results')
  end
end
