require "gosu"
require_relative "player"
require_relative "bullet"

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Wordpress game lulz"
    @background_image = Gosu::Image.new(self, "resources/images/lisinge.jpg", true)

    @player = Player.new(self)
    @player.warp(320, 240)
    @bullets = []
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end

    if button_down? Gosu::KbSpace
      bullet = Bullet.new(self, @player.x, @player.y, @player.angle)
      @bullets << bullet
    end

    @bullets.each do |bullet|
      bullet.move
      @bullets.delete(bullet) if bullet.stopped?
    end
    @player.move
  end

  def draw
    @player.draw
    @bullets.each(&:draw)
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
