class Life
  attr_accessor :prev, :next

  def initialize(width:, height:)
    @width = width
    @height = height
    init_field
  end

  def step

  end

  private

  def init_field
    @prev = Field.new(width: @width, height: @height)
    @next = Field.new(width: @width, height: @height)
    (@width * @height / 4).times.each do
      @prev.alive!(rand(@width), rand(@height))
    end
  end
end
