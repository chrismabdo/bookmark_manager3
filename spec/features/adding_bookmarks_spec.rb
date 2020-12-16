feature 'Adding a new bookmark' do
    scenario 'will add a new url to bookmark table' do
        visit('/bookmarks')
        fill_in('new_bookmark', with: "http://www.chillysbottles.com")
        click_button "Add Bookmark"
        expect(page).to have_content 'http://www.chillysbottles.com'

    end
end