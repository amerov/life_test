require 'rubygems'
require 'bundler/setup'
require_relative 'app/controllers/front_controller'
require_relative 'app/models/field'
require_relative 'app/models/life'
require_relative 'app/views/life_view'

LifeController.new.main_action
