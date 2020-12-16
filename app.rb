require 'sinatra/base'
require './lib/bookmark'

class Bookmark_manager < Sinatra::Base
  enable :sessions

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/create' do
    Bookmark.create(params[:new_bookmark])
    redirect '/bookmarks'
  end

  get '/confirmation' do
    erb :confirmation
  end

  run! if app_file == 0
end
