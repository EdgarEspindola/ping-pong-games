module GamesHelper
  
  def format_score(user_score, score_oponent)
    "#{user_score}-#{score_oponent}"    
  end
  
  def format_result(user_score, score_oponent)
    if user_score > score_oponent
      "W"
    else
      "L"
    end
  end
end
