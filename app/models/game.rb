class Game < ActiveRecord::Base
  belongs_to :oponent, class_name: 'User'
  belongs_to :user
  
  validates :date_played, presence: true
  validates :oponent_id, :user_id, presence: true
  validates :user_score, :score_oponent, presence: true  
  validates :user_score, :score_oponent, allow_blank: true, numericality: { greater_than: 0 }
  validate :not_same_score_permitted, if: (:user_score && :score_oponent)
  validate :difference_scores, if: (:user_score && :score_oponent)
  validate :score_for_win, if: (:user_score && :score_oponent)
  
  SCORE_FOR_WIN = 21
  
  private
  
    def difference_scores          
      diff_score = (user_score - score_oponent).abs
      if diff_score < 2
        errors.add(:base, "Invalid score difference")
      end     
    end
    
    def not_same_score_permitted
      if user_score.eql?(score_oponent)
        errors.add(:base, "Equal scores not permited")
      end
    end
    
    def score_for_win
      if user_score < SCORE_FOR_WIN && score_oponent < SCORE_FOR_WIN
        errors.add(:base, "Not score valid for win")
      end
    end
end
