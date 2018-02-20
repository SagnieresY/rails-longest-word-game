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
    # @letters = params[:letters]
    @letters = ["c", "a", "l"]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    @word_spec = JSON.parse(word_serialized)

    @word = "call"
    @letters = ["a", "c", "l"]
    @word_array = @word.split(//)
    @word_array_const = @word.split(//)
    @letters.each do |letter|
      if @word_array.include?(letter)
        @word_array.slice(letter)
      end
    end

    if @word_spec['found'] && word_check == true && counter == @word.length
      @reply = "Nice! '#{@word.capitalize}' is a valid english word that can be built out of #{@letters}"
    elsif @word_spec['found'] == false
      @reply = "Boohoo.. '#{@word.capitalize}' is NOT english word"
    else
      @reply = "Boohoo.. '#{@word.capitalize}' is indeed a word, but cannot be built with #{@letters}"
    end

  end
end
