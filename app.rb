require 'sinatra/base'
require 'sinatra'
require './lib/chitter.rb'

class Chitter_App < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Chitter.new.get_posts
    @username = session[:username]
    @auth_token = session[:auth_token]
    erb :index
  end

  post '/signup' do
    session[:username] = params[:username]
    @user = Chitter.new.signup(params[:username], params[:password])
    session[:auth_token] = @user['session_key']
    session[:user_id] = @user['user_id']
    redirect '/'
  end

  post '/login' do
    session[:username] = params[:username]
    @user = Chitter.new.getSessionKey(params[:username], params[:password])
    session[:auth_token] = @user['session_key']
    session[:user_id] = @user['user_id']
    redirect '/'
  end

  post '/send_post' do
    Chitter.new.send_post(session[:auth_token], params[:message], session[:user_id])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
