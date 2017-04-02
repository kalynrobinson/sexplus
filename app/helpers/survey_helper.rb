module SurveyHelper
  def fantasy_rating(rating)
    if rating >= 6
      'Interested'
    elsif rating >= 1
      'If partner is interested'
    end
  end

  def fantasy_stars(rating)
    rating = rating > 5 ? rating - 5 : rating
    ('<i class="material-icons fantasy-rating">favorite</i>' * rating).html_safe
  end

  def preference_rating(rating, preference)
    keys = preference.question.options.keys
    rating = rating.to_i

    if rating == 0
      preference.question.options[keys[0]]
    else
      ndx = (rating / 5).floor
      preference.question.options[keys[ndx]]
    end
  end

  def preference_stars(rating)
    rating = rating.to_i
    stars = rating % 5 > 0 ? rating % 5 : 1

    ('<i class="material-icons fantasy-rating">favorite</i>' * stars).html_safe
  end

  def parse_token(message, user1, user2)
    msg = message.gsub(/\$1/, user1)
    msg.gsub!(/\$2/, user2)
  end
end
