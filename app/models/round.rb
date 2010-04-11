class Round
  attr_reader :symbols, :secret_word, :miss_count, :err_mess

  def initialize
    @symbols=[]
    @secret_word = Word.random
    @miss_count = 0
  end

  def add_miss
    @miss_count += 1
  end

  def add_symbol(symbol)
    symbol = symbol.upcase
    @err_mess = self.validate_symbol( symbol)
    return false unless @err_mess.nil?
    @symbols << symbol
    self.add_miss unless self.secret_word.include?(symbol)

    @status = 'miss' if self.miss_count >= 7
    @status = 'won' if self.all_symbols
    true
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

  def comleted?
    return true unless @status.nil?
  end

  def round_result
    return @status
  end
end