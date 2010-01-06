Given /^the following users$/ do |table|
  table.hashes.each do |hash|
    hash = hash.merge( { :password_confirmation => hash[:password] } ) if hash[:password]
    Factory(:user, hash)
  end
end
  
Given /^I am logged in$/ do
  user = Factory :user
  visit login_url
  fill_in "username", :with => user.username
  fill_in "password", :with => user.password
  click_button "Log in"
end

Given /^I logout$/ do
  visit logout_url
end

Given /^I am logged in as an "([^\"]*)" member$/ do |company|
  user = Factory(:user, :company => Factory(:company, :name => company))
  visit login_url
  fill_in "username", :with => user.username
  fill_in "password", :with => user.password
  click_button "Log in"
end

Given /^I am logged in as "([^\"]*)" with the password "([^\"]*)"$/ do |username, password|
  visit login_url
  fill_in "username", :with => username
  fill_in "password", :with => password
  click_button "Log in"
end

Given /^I am not logged in$/ do
  visit logout_url
end
