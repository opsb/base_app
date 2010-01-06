# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

unless ENV["HEROKU_ENV"]
  require 'cucumber/rake/task'
  require 'rcov/rcovtask'
  namespace :rcov do

    rcov_opts = ['-T','--exclude /Library/Ruby/Site/*,.rip/*,gems/*,rcov*,features/step_definitions/webrat_steps.rb','features/support/version_check.rb']

    desc 'Measures cucumber coverage'
    Cucumber::Rake::Task.new(:features) do |t| 
      rm_f 'coverage.features'   
      t.rcov = true
      t.rcov_opts = rcov_opts
      t.rcov_opts << '-o coverage.features'
    end

    desc 'Measures shoulda coverage'  
    Rcov::RcovTask.new(:tests) do |t|
      t.libs << 'test'
      t.test_files = FileList['test/unit/*_test.rb','test/functional/*_test.rb','test/unit/helpers/*_test.rb']
      t.rcov_opts = rcov_opts
      t.output_dir = "coverage.tests"
    end

    desc 'Measures all coverage'  
    task :all do
      ["features", "tests"].each{ |task| Rake::Task["rcov:#{task}"].invoke }
    end
  end

  task :default => ["rcov:all"]  
end
