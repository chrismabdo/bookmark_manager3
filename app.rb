require 'sinatra/base'

class Bookmark_manager < Sinatra::Base

  get '/' do
    'hello world'
  end

  run! if app_file == 0
end