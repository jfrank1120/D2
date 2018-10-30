require 'simplecov'
SimpleCov.start
Dir["#{File.dirname(__FILE__)}/tests/*.rb"].each {|file| require file }
