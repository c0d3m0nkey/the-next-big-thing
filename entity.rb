class Entity
  attr_reader :x, :y, :width, :height, :angle, :image, :alive
  def initialize(window, x, y, angle, sprite, scale = 1)
    @image = sprite
    @x = x
    @y = y
    @scale = scale
    @width = @image.width * @scale
    @height = @image.height * @scale
    @angle = angle
    @window = window
    @alive = true
  end

  def update
  end

  def kill
    @alive = false
  end

  def remove?
    @remove
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, @scale, @scale)
  end
end
