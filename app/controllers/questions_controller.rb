class QuestionsController < ApplicationController
  def index
    @categories = Category.all
  end
end
