Given /^I have valid stories$/ do
  FactoryGirl.create(:story, title: 'The Cool Thing')
  FactoryGirl.create(:story, title: 'The Other Cool Thing')
  FactoryGirl.create(:story, title: 'The Coolest Thing Ever')
end
