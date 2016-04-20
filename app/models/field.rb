class Field

  def initialize(width:, height:)
    @width = width
    @height = height
    set_items
  end

  def alive?(x, y)
    _x = x + @width % @width
    _y = y + @height % @height
    @items[_x][_y]
  end

  def set(x, y, v)
    @items[x][y] = v
  end

  def items
    @items
  end

  private

  def set_items
    @items = Array.new(@width, Array.new(@height))
  end

end

