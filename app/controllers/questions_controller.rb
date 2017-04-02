class QuestionsController < ApplicationController
  def index
    @categories = Category.all
  end

  scope :mutual, -> (category) { where("value[0] > 0") }
end
