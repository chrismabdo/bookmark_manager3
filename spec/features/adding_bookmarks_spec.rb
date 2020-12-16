feature 'Adding a new bookmark' do
    scenario 'will add a new url to bookmark table' do
        visit('/bookmarks')
        fill_in('url', with: "http://www.chillysbottles.com")
        fill_in('title', with: 'Chillys')
        click_button "Add Bookmark"
        expect(page).to have_link('Chillys', href: 'http://www.chillysbottles.com')
    end
end