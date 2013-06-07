class IdiomsController < ApplicationController
  def new
    @idiom = Idiom.new
  end

  def create
    flash[:notice] = '用意周到を登録しました。'
    redirect_to new_idiom_path
  end
end
