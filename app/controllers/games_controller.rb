class GamesController < ApplicationController
  before_filter :get_round

  def index
    @miss_count = @round.miss_count
  end

  def start
    clear_round
    flash[:notice]=nil
    redirect_to :action => :index
  end

  def miss
    flash[:notice]='Вы проиграли!'
    @image_name = 'zhmur.jpg'
    render :action => :end_game
  end

  def won
    flash[:notice]='Вы ВЫИГРАЛИ!!!'
    @image_name = 'zhmur_alive.jpg'
    render :action => :end_game
  end

  def end_game
    clear_round
  end


  def add_symbol
    if(@round.add_symbol(params[:alpha]))
      @round.comleted? ? redirect_to(:action => @round.round_result) : redirect_to( :action => :index)
      return
    else
      unless @round.err_mess.nil?
        flash[:notice] = @round.err_mess
      end
    end
    redirect_to :action => :index
  end

private

  def clear_round
    session[:round] = nil
  end

  def get_round
    session[:round] = Round.new if session[:round].nil?
    @round = session[:round]
  end
end
