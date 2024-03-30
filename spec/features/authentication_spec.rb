require 'rails_helper'

RSpec.feature "User authentication", type: :feature do
  context "Registration" do
    scenario "to be successful" do
      visit new_registration_path
      fill_in "Name", with: "John Doe"
      fill_in "Email", with: "johndoe@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Register"
      expect(page).to have_current_path(registrations_path)
    end

    scenario "should be fail" do
      visit new_registration_path
      click_button "Register"
      expect(page).to have_current_path(new_registration_path)
    end
  end
  context "Login" do
    scenario "to be successfull" do
      visit new_session_path
      fill_in "Email", with: "johndoe@example.com"
      fill_in "Password", with: "password"
      click_button "Login"
      expect(page).to have_current_path(root_path)
    end

    scenario "to be fail" do
      visit new_session_path
      click_button "Login"
      expect(page).to have_current_path(sessions_path)
    end

  end
end
