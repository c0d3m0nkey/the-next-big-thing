class Bullet
  def initialize(window, x, y, angle, ssj)
    @image = Gosu::Image.new(window, "resources/images/callebullet.png", false)
    @x = x
    @y = y
    @ssj = ssj
    @angle = angle
    @vel_x = @vel_y = 30
    if @ssj then
 	@vel_x = @vel_y = 100
    end
  end

  def move
    @x += Gosu::offset_x(@angle, @vel_x)
    @y += Gosu::offset_y(@angle, @vel_y)
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def stopped?
    @vel_x < 1.0 || @vel_y < 1.0
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
