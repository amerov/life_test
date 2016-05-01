class Field

  attr_accessor :items

  def initialize(width:, height:)
    @width = width
    @height = height
    set_items
  end

  def alive?(x, y)
    _x = x + @width % @width
    _y = y + @height % @height
    @items[_y][_x]
  end

  def alive!(x, y)
    @items[y][x] = true
  end

  def dead!(x, y)
    @items[y][x] = false
  end


  def next(x, y)
    alive = 0
    [-1, 0, 1].each do |i|
      [-1, 0, 1].each do |j|
        if (j != 0 || i != 0) && alive?(x + i, y + j)
          alive += 1
        end
      end
    end
    alive == 3 || alive == 2 && alive?(x, y)
  end

  private

  def set_items
    @items = Array.new(@height) { Array.new(@width) { false } }
  end

end
