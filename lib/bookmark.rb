require 'pg'


class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager_2')
    end

    result = connection.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| 
    Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
     }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager_2')
    end
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url']) 
  end

  def self.delete(title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager_2')
    end

    connection.exec("DELETE FROM bookmarks WHERE title = #{title}")
  end
end

