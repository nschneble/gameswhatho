# Helper methods for board games
module GamesHelper
  def play_time_badge_colors(game)
    if game.short?
      "text-emerald-500 bg-emerald-100/60"
    elsif game.medium?
      "text-yellow-500 bg-yellow-100/60"
    else
      "text-red-500 bg-red-100/60"
    end
  end
end
