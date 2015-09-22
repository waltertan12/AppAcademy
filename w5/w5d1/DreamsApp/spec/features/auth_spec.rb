require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end
  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in "Username", { with: "Walter"}
      fill_in "Password", { with: "password" }
      click_button "Hello"
      expect(current_path).to eq(dreams_path)
    end
  end
end

feature "logging in" do
  scenario "shows username on the homepage after login" do
    user = create(:user)
    login(user)
    expect(current_path).to eq(dreams_path)
    expect(page).to have_content(user.username)
  end
end

feature "logging out" do
  given(:user) { create(:user) }
  scenario "begins with logged out state" do
    visit new_user_url
    expect(page).to_not have_content(user.username)
  end
  scenario "doesn't show username on the homepage after logout" do
    login(user)
    click_button "Goodbye :("
    expect(page).to_not have_content(user.username)
  end
end
