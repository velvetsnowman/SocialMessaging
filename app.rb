require 'sinatra/base'
require 'sinatra'
require './lib/chitter.rb'

class Chitter_App < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Chitter.new.get_posts
    @username = session[:username]
    erb :index
  end

  post '/signup' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    @user = Chitter.new.signup(params[:username], params[:password])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
