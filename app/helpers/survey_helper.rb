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
      keys.delete_at(0)
      ndx = (rating / 5).floor
      preference.question.options[key[ndx]]
    end
  end

  def preference_stars(rating)
    rating = rating.to_i
    stars = rating % 5 > 0 ? rating % 5 : 1

    ('<i class="material-icons fantasy-rating">favorite</i>' * stars).html_safe
  end

  def parse_token(message, taken, user1, user2)
    if taken == 0
      names = [user1, user2]
    else
      names = [user2.user2_name, user1]
    end

    msg = message.gsub(/\$1/, names[0])
    msg.gsub!(/\$2/, names[1])
  end
end
