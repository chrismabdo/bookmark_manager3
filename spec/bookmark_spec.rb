require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect( dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create("http://www.makersacademy.com", "Makers Academy")
      Bookmark.create("http://www.destroyallsoftware.com", "Destroy All Software")
      Bookmark.create("http://www.google.com", "Google")
   
      bookmarks = Bookmark.all
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create('http://www.testbookmark.com', 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
end
