require_relative "../../util/grid"

def scan_line(grid, point, direction, size)
  chars = ""
  result = 0
  size.times do |i|
    chars += grid.index(point)
    result += 1 if (chars[-4..] == "XMAS" || chars[-4..] == "SAMX")
    point += direction
  end
  result
end

input = File.read("input.txt")
grid = Grid(input)

size = grid.width
part1 = 0

size.times do |i|
  part1 += scan_line(grid, Point.new(i, 0), Grid::DOWN, size)
  part1 += scan_line(grid, Point.new(0, i), Grid::RIGHT, size)
end

(size - 3).times do |i|
  part1 += scan_line(grid, Point.new(i, 0), Grid::DOWN + Grid::RIGHT, size - i)
  part1 += scan_line(grid, Point.new(0, i + 1), Grid::DOWN + Grid::RIGHT, size - 1 - i)

  part1 += scan_line(grid, Point.new(size - 1 - i, 0), Grid::DOWN + Grid::LEFT, size - i)
  part1 += scan_line(grid, Point.new(size - 1, i + 1), Grid::DOWN + Grid::LEFT, size - 1 - i)
end

puts "Part1: #{part1}"


part2 = 0;

1.upto(grid.width - 2) do |x|
  1.upto(grid.height - 2) do |y|
    point = Point::new(x, y);

    if grid[point] == 'A'
      ul = grid[Point::new(x - 1, y - 1)]
      ur = grid[Point::new(x + 1, y - 1)]
      dl = grid[Point::new(x - 1, y + 1)]
      dr = grid[Point::new(x + 1, y + 1)]
      part2 += 1 if (ul == "M" && ur == "S" && dl == "M" && dr == "S")
      part2 += 1 if (ul == "S" && ur == "S" && dl == "M" && dr == "M")
      part2 += 1 if (ul == "S" && ur == "M" && dl == "S" && dr == "M")
      part2 += 1 if (ul == "M" && ur == "M" && dl == "S" && dr == "S")
    end
  end
end

puts "Part2: #{part2}"
