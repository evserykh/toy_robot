class Direction
  VALUES = %w[NORTH EAST SOUTH WEST].freeze

  def self.parse(value)
    return nil unless VALUES.include?(value)
    new(value)
  end

  def left
    index = VALUES.index(value)
    self.class.new(VALUES.rotate(-1)[index])
  end

  def right
    index = VALUES.index(value)
    self.class.new(VALUES.rotate[index])
  end

  def to_s
    value
  end

  VALUES.each do |direction|
    define_method "#{direction.downcase}?" do
      value == direction
    end
  end

  private

  attr_accessor :value

  def initialize(value)
    @value = value
  end
end
