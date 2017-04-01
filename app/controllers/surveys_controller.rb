class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @survey.build_user_pair
  end

  def edit
    @survey = Survey.find_by(token: params[:id])
  end

  def create
    puts '*' * 50
    puts survey_params.inspect
    puts '*' * 50
    @survey = Survey.new(survey_params)
    puts 'CATEGORY IDS: '
    puts @survey.category_ids
    puts 'USER1 INFO: '
    puts @survey.user_pair.user1_name
    puts @survey.user_pair.user1_genitals
    puts 'USER2 INFO: '
    puts @survey.user_pair.user2_name
    puts @survey.user_pair.user2_genitals
    puts @survey.save!
    puts '*' * 50
    if @survey.save
      puts '+' * 50
      flash[:success] = "Survey submitted"
      redirect_to @survey
    else
      puts '-' * 50
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
