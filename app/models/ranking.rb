class Ranking < ActiveRecord::Base
  belongs_to :user
  
  def self.update_for_the_game(game)
    user = game.user   
    oponent = game.oponent
    
    ranking_user = user.ranking || create_ranking(game.user)
    ranking_oponent = oponent.ranking || create_ranking(game.oponent)
        
    if game.user_score > game.score_oponent      
      ranking_user.score += obtain_score(ranking_user.score, ranking_oponent.score)
    else
      ranking_oponent.score += obtain_score(ranking_oponent.score, ranking_user.score)     
    end
    
    ranking_user.games_played += 1
    ranking_oponent.games_played += 1
    
    ranking_user.save   
    ranking_oponent.save   
  end
  
  private 
  
    def self.create_ranking(user)
      ranking = Ranking.new
      ranking.user = user
      ranking.score = 0
      ranking.games_played = 0
      ranking.save    
      
      ranking
    end   
  
    def self.obtain_score(user_score, oponent_score)
      if user_score > oponent_score
        return 10
      elsif user_score < oponent_score
        return 100
      else
        return 1
      end
    end
    
end
