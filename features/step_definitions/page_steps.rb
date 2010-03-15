When /^I follow the "([^\"]*)" link for "([^\"]*)"$/ do |link, cell_value|
  within "//*[.//text()='#{cell_value}' and .//a[text()='#{link}']]" do |scope|
   scope.click_link link
 end
end