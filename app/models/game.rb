class Game
  attr_reader :time

  def initialize(attr)
    if attr.nil?
      @time = 1
      @point = 0
      return
    end

    @time = attr.fetch(:time, 1)
    @point = attr.fetch(:point, 0)
  end

  def answer(answer)
    @last_answer = case @time
                   when 1
                     '一' == answer
                   else 2
                     '袖' == answer
                   end
    if success?
      @point += 1
    end
    next_time
    self
  end

  def success?
    @last_answer
  end

  def to_session
    {
      time: @time,
      point: @point,
    }
  end

  def next_time
    @time += 1
  end

  def point
    @point
  end

  def finish?
    @time > 2
  end
end
