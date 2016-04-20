class Field

  def initialize(width:, height:)
    @width = width
    @height = height
    set_items
  end

  def alive?(x, y)

  end

  def set(x, y, v)

  end

  def items
    @items
  end

  private

  def set_items
    @items = Array.new(@width, Array.new(@height))
  end

end

