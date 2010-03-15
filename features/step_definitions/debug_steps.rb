Then /^I view the html$/ do
  puts current_dom
end

Then /^show emails$/ do
  puts ActionMailer::Base.deliveries
end

Then /^show all (.+) records$/ do |table|
  (eval table).all.each{ |record| puts record.inspect }
end