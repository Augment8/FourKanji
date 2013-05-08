class Question
  attr_reader :idiom, :answer_number

  # @param idiom 問題にする四字熟語
  # @answer_number 正解にする場所
  # @choicees 選択肢として与える漢字, A の部分に解答を挿入する
  def initialize(idiom, answer_number, choicees)
    @idiom = idiom
    @answer_number = answer_number

    unless choicees.include? 'A'
      raise 'choicees は文字列にAを含めてください', ArgumentError
    end
    unless choicees.size == 4
      raise 'choicees は4文字にしてください', ArgumenError
    end
    @choicees = choicees
  end

  # 問題の n番目の文字を返すメソッドを生成
  # 問題になって隠される場合は nil を返す
  [:first, :second, :third, :fourth].each_with_index do |value, index|
    define_method(value) do
      if answer_index == index
        nil
      else
        idiom.content[index]
      end
    end
  end

  def description
    idiom.description
  end

  def answer
    idiom.content[answer_index]
  end

  def answers
    @choicees.gsub('A',answer).each_char.to_a
  end

  private

    def answer_index
      @answer_number - 1
    end
end
