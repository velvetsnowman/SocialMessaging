require 'sinatra/base'
require 'sinatra'
require './lib/chitter.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    "All peeps"
  end

  run! if app_file == $PROGRAM_NAME
end
