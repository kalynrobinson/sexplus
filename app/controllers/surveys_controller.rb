class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @survey.build_user_pair
  end

  def edit
    @survey = Survey.find_by(token: params[:id])

    redirect_to survey_path @survey.token if @survey.taken >= 2

    @categories = @survey.category_ids.map { |c| Category.find(c) }
    @categories.each do |c|
      c.questions.each do |q|
        @survey.survey_questions.build(question_id: q.id, survey_id: @survey.id)
      end
    end
  end

  def update
    @survey = Survey.find_by(token: params[:id])

    survey_params[:survey_questions].keys.each do |id|
      survey_question = @survey.survey_questions.where(id: id).first
      survey_question.value << survey_params[:survey_questions][id][:value]
      survey_question.save
    end

    @survey.taken += 1

    if @survey.save
      flash[:success] = "Successfully submitted survey!"
      redirect_to survey_path @survey.token
    else
      render 'edit'
    end
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.category_ids.delete_at(0)

    @categories = @survey.category_ids.map { |c| Category.find(c) }
    @categories.each do |c|
      c.questions.each do |q|
        @survey.survey_questions.build(question_id: q.id, survey_id: @survey.id,
                                       category_id: c.id)
      end
    end

    if @survey.save
      email = @survey.user_pair.user2_email
      SurveyMailer.survey_email(email, @survey.token).deliver if email
      flash[:success] = "Survey submitted"
      redirect_to edit_survey_path @survey.token
    else
      render 'new'
    end
  end

  def show
    @survey = Survey.find_by(token: params[:id])
    @categories = @survey.category_ids.map { |c| Category.find(c) }
  end

  def info
  end

  def destroy
    survey = Survey.find_by(token: params[:id])
    Survey.delete(survey.id)
  end

  private

  def survey_params
    params.require(:survey).permit(:granular, category_ids: [],
           user_pair_attributes: [:user1_name, :user1_genitals, :user1_email, :user2_name, :user2_genitals, :user2_email],
           survey_questions: [:value])
  end
end
