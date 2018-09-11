feature 'going to the homepage' do
  scenario 'a user should see a list of peeps' do
    visit('/')
    expect(page).to have_content 'my first peep :)'
  end
end
