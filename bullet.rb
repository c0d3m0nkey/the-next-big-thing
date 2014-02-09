require_relative "entity"

class Bullet < Entity
  def initialize(window, x, y, angle, ssj)
    @ssj = ssj
    if ssj
      @vel_x = @vel_y = 100
      super(window, x, y, angle, Gosu::Image.new(window, "resources/images/ssjcallebullet.png", false))
    else
      @vel_x = @vel_y = 30
      super(window, x, y, angle, Gosu::Image.new(window, "resources/images/callebullet.png", false))
    end

    Thread.new do
      sleep 0.5
      @remove = true
    end
  end

  def update
    @x += Gosu::offset_x(@angle, @vel_x)
    @y += Gosu::offset_y(@angle, @vel_y)
    @x %= 640
    @y %= 480
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def remove?
    @remove
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
