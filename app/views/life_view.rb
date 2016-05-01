class LifeView

  def render(items)
    print "\x0c"
    res = ''
    items.each do |x|
      x.each do |y|
        res << (y ? '*' : ' ')
      end
      res << "\n"
    end
    print res
  end
end

