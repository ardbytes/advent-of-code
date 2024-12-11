# See: https://github.com/maneatingape/advent-of-code-rust/blob/main/src/year2024/day07.rs

def valid1(test_value, terms, index)
  if index == 0 
    test_value == terms[0]
  else 
    (test_value % terms[index] == 0 &&
     valid1(test_value / terms[index], terms, index - 1)) ||
    (test_value >= terms[index] &&
     valid1(test_value - terms[index], terms, index - 1))
  end
end

def valid2(test_value, terms, index)
  if index == 0 
    test_value == terms[0]
  else 
    (test_value % next_power_of_ten(terms[index]) == terms[index] &&
     valid2(test_value / next_power_of_ten(terms[index]), terms, index - 1)) ||
    (test_value % terms[index] == 0 &&
     valid2(test_value / terms[index], terms, index - 1)) ||
    (test_value >= terms[index] &&
     valid2(test_value - terms[index], terms, index - 1))
  end
end

def next_power_of_ten(n)
  if n < 10 
    10
  elsif n < 100 
    100
  else 
    1000
  end
end

input = File.readlines("input.txt").collect(&:chomp)

part1 = input.reduce(0) do |sum, line|
  target, terms = line.split(": ")
  target = target.to_i
  terms = terms.split(" ").collect {|n| n.to_i}
  if valid1(target, terms, terms.length - 1)
    sum += target
  else
    sum
  end
end

puts "Part1: #{part1}"

part2 = input.reduce(0) do |sum, line|
  target, terms = line.split(": ")
  target = target.to_i
  terms = terms.split(" ").collect {|n| n.to_i}
  if valid2(target, terms, terms.length - 1)
    sum += target
  else
    sum
  end
end

puts "Part2: #{part2}"
