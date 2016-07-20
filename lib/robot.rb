require_relative 'table'

class Robot
  FACINGS = %w(NORTH EAST SOUTH WEST)

  attr_reader :position, :facing

  def initialize
    @table = Table.new
  end

  def place(x, y, facing)
    p = Position.new(x.to_i, y.to_i)

    if @table.valid_position?(p) && FACINGS.include?(facing)
      @position = p
      @facing = facing
    end
  end

  def left
    if placed?
      index = FACINGS.index(@facing)
      @facing = FACINGS[index - 1]
    end
  end

  def right
    if placed?
      index = FACINGS.index(@facing)
      @facing = FACINGS[index + 1] || FACINGS.first
    end
  end

  def move
    if placed?
      case @facing
      when 'NORTH'
      	@position.y += 1 if @position.y < @table.height - 1
      when 'EAST'
      	@position.x += 1 if @position.x < @table.width - 1
      when 'SOUTH'
      	@position.y -= 1 if @position.y > 0
      when 'WEST'
      	@position.x -= 1 if @position.x > 0
      end
    end
  end

  def report
    if placed?
      puts "Output: #{@position.x},#{@position.y},#{@facing}"
    end
  end

  private

  def placed?
    !@position.nil? && !@facing.nil?
  end
end
