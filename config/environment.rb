# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
def debug_log *args
  require 'pp'
  msg = args.inject(""){|r, x|r += x.pretty_inspect}.chomp
  puts "\e[42m#{msg}\e[0m"
end