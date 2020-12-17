feature 'Deleting existing bookmarks' do
    scenario 'will delete a bookmark' do
        visit('/bookmarks')
        fill_in('url', with: "http://www.chillysbottles.com")
        fill_in('title', with: 'Chillys')
        click_button "Add Bookmark"
        click_button "Delete Bookmarks"
        check 'Chillys'
        expect(page).to not_include 'Chillys'
    end
end