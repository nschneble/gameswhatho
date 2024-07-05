# Helper methods for board games
module GamesHelper
  def play_time_badge_classes(game)
    if game.short?
      "inline px-3 py-1 rounded-full gap-x-2 text-emerald-500 bg-emerald-100/60"
    elsif game.medium?
      "inline px-3 py-1 rounded-full gap-x-2 text-yellow-500 bg-yellow-100/60"
    elsif game.long?
      "inline px-3 py-1 rounded-full gap-x-2 text-red-500 bg-red-100/60"
    else
      "inline px-3 py-1 rounded-full gap-x-2"
    end
  end
end
