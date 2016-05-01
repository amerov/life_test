require 'rubygems'
require 'bundler/setup'
require 'optparse'
require_relative 'app/controllers/front_controller'
require_relative 'app/models/field'
require_relative 'app/models/life'
require_relative 'app/views/life_view'

options = {}

parser = OptionParser.new do |opts|
  opts.on('-s SLEEP', '--sleep SLEEP') do |sleep|
    options[:sleep] = sleep.to_i
  end

  opts.on('-w WIDTH', '--width WIDTH') do |width|
    options[:width] = width.to_i
  end

  opts.on('-h HEIGHT', '--height HEIGHT') do |height|
    options[:height] = height.to_i
  end

  opts.on('-c COUNT', '--count COUNT') do |count|
    options[:count] = count.to_i
  end
end

parser.parse!
puts options

LifeController.new(options).main_action

