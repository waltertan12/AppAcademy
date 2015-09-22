require 'spec_helper'
require 'rails_helper'



feature "add comment to dreams" do
  before :each do
    user = create(:user)
    login(user)
    non_spooky = create(:dream)
    visit dream_url(non_spooky)
  end

  scenario "add comment form on dream show pages" do
    expect(page).to have_content("Add Dream Comment")
  end

  scenario "non_spooky comment should appear after create" do
    fill_in "body", with: "what a pleasant dream!"
    choose "non_spooky"
    click_button "Dream Comment"

    expect(page).to have_content("what a pleasant dream!")
  end

  scenario "spooky comment should appear as 👻" do
    fill_in "body", with: "this is a SPOOOKY COMMENT"
    choose "spooky"
    click_button "Dream Comment"

    expect(page).to have_content("👻")
  end
end

feature "user show displays user's comments" do
  before :each do
    user = create(:user)
    login(user)
    non_spooky = create(:dream)
    visit user_url(user)
  end

  scenario "for both spooky and non_spooky comments" do
    fill_in "body", with: "what a pleasant dream!"
    choose "non_spooky"
    click_button "Dream Comment"

    expect(page).to have_content("what a pleasant dream!")

    fill_in "body", with: "this is a SPOOOKY COMMENT"
    choose "spooky"
    click_button "Dream Comment"

    expect(page).to have_content("👻")
  end
end
