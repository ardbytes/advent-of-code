class Point

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)
    Point.new(x + other.x, y + other.y)
  end

  def ==(other)
    x == other.x && y == other.y
  end
end
