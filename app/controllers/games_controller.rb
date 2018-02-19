require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @sample_letters = []
    10.times do
      @sample_letters << ("a".."z").to_a.sample
    end
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    @word_spec = JSON.parse(word_serialized)

    if @word_spec['found']
      @reply = "Nice! '#{@word.capitalize}' is a valid english word that can be built out of #{@sample_letters}"
    else
      @reply = "Boohoo.. '#{@word.capitalize}' is NOT english"
    end

  end
end
