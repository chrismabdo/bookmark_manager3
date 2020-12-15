feature 'Testing infrastructure' do
  scenario 'Can run on webpage and return hello world' do
    visit('/')
    expect(page).to have_content 'hello world'
  end
end
