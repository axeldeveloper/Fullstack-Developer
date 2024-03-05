

namespace :test do
  desc 'Run tests with coverage'
  task :coverage do
    require 'simplecov'
    SimpleCov.start :rails do

      @filters = []
      load_adapter 'test_frameworks'



      # add_filter '/spec/'
      # add_filter '/config/'
      #
      # add_group 'Controllers', 'app/controllers'
      # add_group 'Models', 'app/models'
      # # add_group 'Helpers', 'app/helpers'
      # add_group 'Libraries', 'lib'
      #
      # SimpleCov.maximum_coverage_drop 5
    end
    Rake::Task['test'].invoke
  end
end