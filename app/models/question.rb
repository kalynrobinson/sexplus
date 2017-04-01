class Question < ApplicationRecord
  store_accessor :options
  belongs_to :category
end
