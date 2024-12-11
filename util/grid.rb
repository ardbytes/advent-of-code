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
    Grid.new(width, height, @chars.dup)
  end

  def index(char)
    index = @chars.index(char)
    y = index / width
    Point.new(index - (y * width), y)
  end

  def [](point)
    x, y = point.x, point.y
    if x < 0 || y < 0
      raise "Negative index"
    end
    @chars[y * width + x] || (raise "Invalid index")
  end

  def []=(point, char)
    x, y = point.x, point.y
    @chars[y * width + x] = char
  end

  def has?(point)
    point.x >= 0 && point.x < width && point.y >= 0 && point.y < height
  end

  def count(char)
    @chars.count(char)
  end

  def to_s
    s = ""
    self.height.times do |y|
      self.width.times do |x|
        s += self[Point.new(x, y)]
      end
      s += "\n"
    end
    s
  end
end

def Grid(input)
  chars = input.split("\n")
  width = chars[0].length
  height = chars.length
  Grid.new(width, height, chars.join)
end

12/10
