require 'sinatra/base'
require 'sinatra'
require './lib/chitter.rb'

class Chitter_App < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Chitter.new.get_posts
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
