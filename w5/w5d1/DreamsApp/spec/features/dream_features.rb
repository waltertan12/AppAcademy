require 'spec_helper'
require 'rails_helper'

feature "new dreams" do
  scenario "it should create dreams" do
    create_dream
    visit dreams_url
    expect(page).to have_content "Dream Builder"
  end

  # feature "dream index" do
  scenario "should show all non-spooky dreams" do
    user = create(:user)
    login(user)

    non_spooky = create(:dream)
    spooky = create(:spooky_dream)

    visit dreams_url
    expect(page).to have_content(non_spooky.title)
    expect(page).to_not have_content(spooky.title)
  end

  scenario "should be able to edit dreams" do
    user = create(:user)
    login(user)

    non_spooky = create(:dream)

    visit edit_dream_url(non_spooky)
    fill_in "Title", with: "omg"
    click_button "Dream Builder"

    expect(page).to have_content("omg")
  end
end
