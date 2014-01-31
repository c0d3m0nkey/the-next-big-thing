class Bullet
  def initialize(window, x, y, angle)
    @image = Gosu::Image.new(window, "resources/images/callebullet.png", false)
    @x = x
    @y = y
    @angle = angle
    @vel_x = @vel_y = 30

    Thread.new do
      sleep 0.5
      @remove = true
    end
  end

  def move
    @x += Gosu::offset_x(@angle, @vel_x)
    @y += Gosu::offset_y(@angle, @vel_y)
    @x %= 640
    @y %= 480
  end

  def remove?
    @remove
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
