class PlayController < ApplicationController
  def index
    @round = get_round
    @miss_count = @round.miss_count
    @secret_word = @round.secret_word
  end

  def get_round
    unless session[:round]
      session[:round] = Round.new
    end
    session[:round]
  end

  def start
    clear_round
    flash[:notice]=nil
    redirect_to :action => :index
  end

  def miss
    flash[:notice]='Вы проиграли!'
    @secret_word = get_round.secret_word
    @image_name = 'zhmur.jpg'
    render :action => :end_game
  end

  def won
    flash[:notice]='Вы ВЫИГРАЛИ!!!'
    @secret_word = get_round.secret_word
    @image_name = 'zhmur_alive.jpg'
    render :action => :end_game
  end

  def end_game
    clear_round
  end


  def add_symbol
    @round = get_round
    puts 'params'
    symbol = params[:alpha].to_s.upcase
    puts 'symbol'
    puts symbol
    err_mess = @round.validate_symbol( symbol)
    if err_mess
      flash[:notice] = err_mess
      redirect_to :action => :index
      return
    end
    @round.add_symbol(symbol)
    puts err_mess
    unless @round.secret_word.include?(symbol)
      @round.add_miss
      if @round.miss_count >= 7
        redirect_to :action => :miss
        return
      end
    end
    if(@round.all_symbols)
      redirect_to :action => :won
      return
    end
    redirect_to :action => :index
  end

  private
#  def has_symbol(alpha)
#    unless flash[:secret_word].gsub(alpha)
#      flash[:counter]
#    end
#  end

  def clear_round
    session[:round] = nil
    session[:miss_count] = 0
  end

end
