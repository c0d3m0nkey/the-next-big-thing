class Entity
  def initialize(window, x, y, angle, sprite)
    @image = sprite
    @x = x
    @y = y
    @angle = angle
  end

  def update
  end

  def remove?
    @remove
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
