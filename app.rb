require 'sinatra/base'
require './lib/bookmark'

class Bookmark_manager < Sinatra::Base
  enable :sessions

  get '/bookmarks' do
     ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/create' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/delete' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/delete'
  end

  post '/conf_delete' do
    Bookmark.delete(params[:title])
    @bookmarks = Bookmark.all
    redirect '/bookmarks'
  end
  run! if app_file == 0
end
