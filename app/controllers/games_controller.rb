class GamesController < ApplicationController
  def index
  end

  def show
    case game.time
    when 1
      idiom = OpenStruct.new({
          content: '一期一会',
          descripion: '一生に一度しかない貴重な機会',
        })
      @question = Question.new idiom, 3, '鎧A袖触'
    when 2
      idiom = OpenStruct.new({
          content: '鎧袖一触',
          descripion: '相手を簡単に倒してしまう',
        })
      @question = Question.new idiom, 2, '一期会A'
    else
      redirect_to action: :result
    end
  end

  def create
    if answer = params[:answer]
      game.answer answer
      if game.success?
        flash[:answer] = :success
      else
        flash[:answer] = :failure
      end
    end
    save_game
    redirect_to action: :show
  end

  def result
    @game = game
  end

  protected
    def game
      @game ||= Game.new session[:game]
    end

    def save_game
      session[:game] = game.to_session
    end
end
