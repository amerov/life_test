class LifeController

  def initialize(count:100, width:50, height:50, sleep:1)
    @count = count
    @width = width
    @height = height
    @life = Life.new(width: width, height: height)
    @view = LifeView.new
    @slp = sleep
  end

  def main_action
    @count.times.each do |n|
      @life.step
      @view.render(@life.a.items)
      sleep @slp
    end
  end
end

