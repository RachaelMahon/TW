class Rover

  CARDINAL_POINTS = ["N","E","S","W"]

  attr_accessor :x_position, :y_position, :orientation, :status,
                :moved, :id

  def initialize(id, x, y, orientation)
    @id = id
    @x_position = x
    @y_position = y
    @orientation = orientation
    @status = "Not lost"
    @moved = false
  end

  def apply_input_to_rover(letter)
      case letter
        when "M" then move
        when "R", "L" then swivel(letter)
        else raise "Instructions terminated at point of invalid character"
      end
  end

  def swivel(letter)
    if letter == "R"
      swivel_to = (CARDINAL_POINTS.index(@orientation) + 1) % 4
      @orientation = CARDINAL_POINTS[swivel_to]
    elsif letter == "L"
      swivel_to = (CARDINAL_POINTS.index(@orientation) - 1) % 4
      @orientation = CARDINAL_POINTS[swivel_to]
    end
  end

  def move
    case @orientation
      when "N" then @y_position += 1
      when "E" then @x_position += 1
      when "S" then @y_position -= 1
      when "W" then @x_position -= 1
    end
  end

  def declare_position_and_orientation
    "#{@x_position}, #{@y_position}, facing #{@orientation}"
  end

  def set_rover_status
    @status = "Lost"
  end

  def set_moved_status
    @moved = true
  end

end
