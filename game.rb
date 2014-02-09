require "gosu"
require_relative "player"
require_relative "bullet"
require_relative "enemy"

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
    @last_enemy_time = Time.now
  end

  def update
    cleanup
    if(Time.now - @last_enemy_time > 3)
      create_enemy
    end
    @entities.each do |entity|
      entity.update
    end
  end

  def cleanup
    @entities.each do |entity|
      @entities.delete(entity) if !entity.alive
    end
  end

  def create_enemy
    @last_enemy_time = Time.now
    prng = Random.new()
    @entities << Enemy.new(self, prng.rand(0..640), prng.rand(0..480), prng.rand(0..359), 7)
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
