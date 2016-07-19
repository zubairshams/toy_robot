Position = Struct.new(:x, :y)

class Table
  attr_reader :width, :height

  def initialize(width: 5, height: 5)
    @width = width
    @height = height
  end

  def valid_position?(pos)
    pos.x > -1 && pos.x < @width && pos.y > -1 && pos.y < @height
  end
end
