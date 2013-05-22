Given /^I am logged in as an author$/ do
  author = FactoryGirl.create(:author, email: 'test@cool.com', password: 'verycoolcool', password_confirmation: 'verycoolcool')
  visit("/login")
  fill_in("Email", with: author.email)
  fill_in("Password", with: author.password)
  click_button("Login")
end
