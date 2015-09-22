def login(user)
  visit new_user_url
  fill_in "Username", { with: user.username }
  fill_in "Password", { with: user.password }
  click_button "Hello"
end
