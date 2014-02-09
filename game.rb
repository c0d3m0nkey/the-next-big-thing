require "gosu"
require_relative "player"
require_relative "bullet"

class GameWindow < Gosu::Window
  attr_reader :entities
  def initialize
    super 640, 480, false
    self.caption = "Wordpress game lulz"
    @background_image = Gosu::Image.new(self, "resources/images/lisinge.jpg", true)

    player = Player.new(self)
    player.warp(320, 240)
    @entities = []
    @entities << player
  end

  def update
    @entities.each do |entity|
      entity.update
      @entities.delete(entity) if entity.remove?
    end
  end

  def draw
    @entities.each(&:draw)
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
