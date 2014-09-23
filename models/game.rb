class Game < ActiveRecord::Base
  def existing(name)
    Game.where("player_two = ?", name)
  end
end