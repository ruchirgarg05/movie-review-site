require 'rails_helper'

feature "Signed in User can add a new movie" do
# Create
# As an authenticated user
# I want to add a movie
# So that others can review it
# Acceptance Criteria
# - I should be logged to the site
# - I should see a form to add a new movie
# - I should get to this form by click the 'Add Movie' link at the top of the page
# - I must provide a movie name
# - Upon successful completion of this form I should be brought to the movie's detail page
# - If I do not supply a movie name, I receive an error message.
# - If an movie with that name is already in the database, I receive an error message."

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
  end

  scenario "user visits new movie page" do
    click_link("Add Movie")
    expect(page).to have_content "Add New Movie"
  end

  scenario "user adds movie successfully" do
    click_link("Add Movie")
    fill_in("Name", with: "Guardians of the Galaxy")
    fill_in("Description", with: "A story about superheroes in space")
    click_button "Add Movie"
    expect(page).to have_content("Movie successfully added.")
  end

  scenario "user does not provide proper information to add a movie" do
    visit new_movie_path
    click_button "Add Movie"
    expect(page).to have_content("Name can't be blank")
  end

  scenario "signed out user tries to add movie" do
    click_link("Sign Out")
    expect(page).to_not have_content("Add Movie")
  end
end
