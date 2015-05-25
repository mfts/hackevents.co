require 'spec_helper'

describe 'Logging In' do

  it "logs the user in and goes to the hackathons" do
    User.create(first_name: "Marc", last_name: "Seitz", email: "marc@hackevents.co", password: "hackevents1234", password_confirmation: "hackevents1234")
    visit new_user_session_path
    fill_in "Email Address", with: "marc@hackevents.co"
    fill_in "Password", with: "hackevents1234"
    click_button "Log In"

    expect(page).to have_content("Hackathons")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "marc@hackevents.co"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password.")
    expect(page).to have_field("Email Address", with: "marc@hackevents.co")
  end

end
