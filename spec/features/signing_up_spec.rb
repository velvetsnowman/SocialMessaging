feature 'going to the homepage' do
  scenario 'should let a user sign up' do
    visit('/')
    fill_in :username, with: "JackBauer"
    fill_in :password, with: "darthvader"
    click_button "Submit"
    expect(page).to have_content "Welcome JackBauer"

  end
end
