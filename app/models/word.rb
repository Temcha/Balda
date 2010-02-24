class Word < ActiveRecord::Base

  def self.random
    puts "In database " + self.count.to_s
    if self.count > 0
      if word = self.find( rand(self.count -1 ) + 1 )
        word.value.upcase
      end
    else
      flash[:notice] = "База данных слов пуста!"
    end

  end
end
