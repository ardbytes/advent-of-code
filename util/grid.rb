require_relative "./point"

class Grid

  DOWN = Point.new(0, 1)

  RIGHT = Point.new(1, 0)

  LEFT = Point.new(-1, 0)
  
  UP = Point.new(0, -1)
  
  attr_accessor :width, :height

  def initialize(width, height, chars)
    @width = width
    @height = height
    @chars = chars
  end

  def dup
    Grid.new(width, height, chars.dup)
  end

  def index(point)
    x, y = point.x, point.y
    if x < 0 || y < 0
      raise "Negative index"
    end
    @chars[y * width + x] || (raise "Invalid index")
  end

  def [](point)
    index(point)
  end
end

def Grid(input)
  chars = input.split("\n")
  width = chars[0].length
  height = chars.length
  Grid.new(width, height, chars.join)
end
