class Round
  attr_reader :symbols, :secret_word, :miss_count

  def initialize
    @symbols=[]
    @secret_word = Word.random
    @miss_count = 0
  end

  def add_miss
    @miss_count += 1
  end
  def add_symbol(symbol)
    @symbols << symbol
  end

  def has_symbol(symbol)
    @symbols.find{|alpha| alpha == symbol}
  end

  def all_symbols
    all = true
    @secret_word.split("").each {|symb|
    unless has_symbol(symb)
      all = false
    end
    }
    all
  end

  def validate_symbol(symbol)
    res = nil
    unless ('a'..'z').include?( symbol) or ('A'..'Z').include?( symbol)
      res = 'Введите букву английского алфавита'
    end
    if has_symbol( symbol )
      res = 'Вы уже называли эту букву!'
    end
    res
  end
end