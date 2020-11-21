class Triangle
  attr_accessor :side1, :side2, :side3
  def initialize(side1, side2, side3)
    self.side1 = side1
    self.side2 = side2
    self.side3 = side3
  end

  def kind
    raise TriangleError if [side1, side2, side3].include?(0) || [side1, side2, side3].any?(&:negative?)
    raise TriangleError if side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
    return :equilateral if side1 == side2 && side2 == side3
    return :isosceles if side1 == side2 || side2 == side3 || side1 == side3

    :scalene
  end

  class TriangleError < StandardError; end
end

triangle = Triangle.new(2, 2, 2)
puts triangle.kind
