# Settings specified here will take precedence over those in config/environment.rb
config.gem "cucumber",      :version => '0.6.3', :lib => false,          :source => "http://gemcutter.org"
config.gem "cucumber-rails",      :version => '0.3.0', :lib => false,          :source => "http://gemcutter.org"
config.gem 'bmabey-email_spec', :lib => 'email_spec'
config.gem "shoulda",       :version => '>= 2.10.2',:lib => "shoulda",      :source => "http://gemcutter.org"
config.gem "factory_girl",  :version => '>= 1.2.3', :lib => "factory_girl", :source => "http://gemcutter.org" 
config.gem 'mocha',         :version => '>= 0.9.8', :lib => false,          :source => "http://gemcutter.org"
config.gem "webrat",        :version => '= 0.6.0',  :lib => false,          :source => "http://gemcutter.org"
config.gem "rspec",         :version => '>= 1.2.9', :lib => false,          :source => "http://gemcutter.org"
config.gem "rspec-rails",   :version => '>= 1.2.9', :lib => false,          :source => "http://gemcutter.org"
config.gem "relevance-rcov",:version => '0.9.2.1',  :lib => false,          :source => "http://gems.github.com"
config.gem "pickle",        :version => '0.2.1',    :lib => false,          :source => "http://gemcutter.org"  

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

# Use SQL instead of Active Record's schema dumper when creating the test database.
# This is necessary if y*our schema can't be completely dumped by the schema dumper,
# like if you have constraints or database-specific column types
# config.active_record.schema_format = :sql