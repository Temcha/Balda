class Word < ActiveRecord::Base

  def self.random
    word = self.find( rand(self.count -1 ) + 1 )
    unless word.nil? 
      word.value.upcase
    else
      word.errors << "База данных слов пуста!"
    end 
  end
end
