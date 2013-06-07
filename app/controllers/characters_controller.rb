class CharactersController < ApplicationController
  def index
    @characters = $idioms.first.content.each_char.to_a
  end
end
