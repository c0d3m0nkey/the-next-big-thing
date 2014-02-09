require_relative "entity"

class Player < Entity
  attr_reader :ssj
  def initialize(window)
    super(window, 0.0, 0.0, 0.0, @image = Gosu::Image.new(window, "resources/images/calle.png", false))
    
    @vel_x = @vel_y = 0.0
    @score = 0
    @ssj = false
    @spacePressed = false

  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def toggleSSJ(window)
	@ssj = !@ssj 
	@image = Gosu::Image.new(window, "resources/images/calle.png", false)
	if @ssj then
	    @image = Gosu::Image.new(window, "resources/images/callessj.png", false)
	end
        @zzj = @ssj
  end
  
  def update
    handle_input
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def handle_input
    if @window.button_down? Gosu::KbLeft or @window.button_down? Gosu::GpLeft then
      turn_left
    end
    if @window.button_down? Gosu::KbRight or @window.button_down? Gosu::GpRight then
      turn_right
    end
    if @window.button_down? Gosu::KbUp or @window.button_down? Gosu::GpButton0 then
      accelerate
    end

    if @window.button_down? Gosu::KbSpace
      if !@spacePressed
        @spacePressed = true
        bullet = Bullet.new(@window, @x, @y, @angle, @ssj)
        @window.entities << bullet
      end
    end

    if !@window.button_down? Gosu::KbSpace
      @spacePressed = false
    end

    if @window.button_down? Gosu::KbEnter or @window.button_down? Gosu::KbReturn then
      toggleSSJ(@window)
    end

  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
