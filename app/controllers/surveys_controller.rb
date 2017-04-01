class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @survey.build_user_pair
  end

  def edit
    @survey = Survey.find_by(token: params[:id])
    @categories = @survey.category_ids.map { |c| Category.find(c) }
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.category_ids.delete_at(0)
    if @survey.save
      @survey.save
      flash[:success] = "Survey submitted"
      redirect_to edit_survey_path @survey.token
    else
      render 'new'
    end
  end

  def show
    @survey = Survey.find_by(token: params[:id])
  end

  def info
  end

  def destroy
    survey = Survey.find_by(token: params[:id])
    Survey.delete(survey.id)
  end

  private

  def survey_params
    params.require(:survey).permit(category_ids: [], user_pair_attributes: [:user1_name, :user1_genitals, :user2_name, :user2_genitals])
  end
end
