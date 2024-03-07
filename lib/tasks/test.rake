

require 'rspec/rails'

namespace :test do
  desc 'Run tests with coverage'

  task :spec do
    puts ">>>>>" * 20
    puts "prepare test"
    RSpec::Core::RakeTask.new(:spec).invoke
  end

  task :coverage do
    require 'simplecov'
    SimpleCov.start :rails do
      add_filter '/config/'
      add_filter 'app/channels/'
      add_filter 'app/admin/'
      add_filter 'app/helpers/'
      add_filter 'app/mailers/'
      add_filter 'lib/'
      #
      add_group 'Controllers', 'app/controllers'
      add_group 'Models', 'app/models'
      # # add_group 'Helpers', 'app/helpers'
      # add_group 'Libraries', 'lib'
    end

    #Rake::Task['test'].invoke
    Rake::Task['spec'].invoke
    # RSpec::Core::RakeTask.new(:spec).invoke
  end
end