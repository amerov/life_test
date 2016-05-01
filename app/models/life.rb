class Life
  attr_accessor :a, :b

  def initialize(width:, height:)
    @width = width
    @height = height
    init_field
  end

  def step
    (@height - 1).times.each do |y|
      (@width - 1).times.each do |x|
        if @a.next(x, y)
          @b.alive!(x, y)
        else
          @b.dead!(x, y)
        end
      end
    end

    _a = @a.items
    @a.items = @b.items
    @b.items = _a
  end

  private

  def init_field
    @a = Field.new(width: @width, height: @height)
    @b = Field.new(width: @width, height: @height)
    (@width * @height / 4).times.each do
      @a.alive!(rand(@width), rand(@height))
    end
  end
end
