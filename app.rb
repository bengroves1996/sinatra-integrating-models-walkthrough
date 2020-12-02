require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(text_from_user)
    @x = @analyzed_text.count_of_words
    @y = @analyzed_text.count_of_vowels
    @z = @analyzed_text.count_of_consonants
    @p = @analyzed_text.most_used_letter['e']
    @w = @analyzed_text.most_used_letter.keys[0]
    erb :results
  end
end
