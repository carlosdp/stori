Given /^I have valid stories$/ do
  FactoryGirl.create(:story, title: 'The Cool Thing')
  FactoryGirl.create(:story, title: 'The Other Cool Thing')
  FactoryGirl.create(:story, title: 'The Coolest Thing Ever')
end

Given /^There are authors$/ do
  FactoryGirl.create(:author, first_name: 'Tony', last_name: 'Stark', email: 'tony@stark.com')
  FactoryGirl.create(:author, first_name: 'Bill', last_name: 'Gates', email: 'bill@gates.com')
  FactoryGirl.create(:author, first_name: 'Jeff', last_name: 'Lawson', email: 'jeff@lawson.com')
end
