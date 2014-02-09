require_relative "entity"
require_relative "bullet"

class Enemy < Entity
  def initialize(window, x, y, angle, velocity)
      @velocity = velocity
      super(window, x, y, angle, Gosu::Image.new(window, "resources/images/lisingeEnemy.jpg", false), 0.2)
  end

  def update
    @x += Gosu::offset_x(@angle, @velocity)
    @y += Gosu::offset_y(@angle, @velocity)
    
    @x %= 640
    @y %= 480

    @window.entities.each do |entity|
      if collide?(entity) && entity != self
        entity.kill
        if entity.class == Bullet
          kill
        end
      end
    end
  end

  def collide?(entity)
    if entity.x > @x && entity.x < @x + @width && entity.y > @y && entity.y < @y + @height
      return true
    else
      return false
    end
  end

  def remove?
    @remove
  end
end
