ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport < TestCase
  # Setup all fixtures in
  fixtures :all

  # Add more helper
end
