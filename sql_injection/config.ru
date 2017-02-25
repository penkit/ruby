require 'rubygems'
require 'bundler'
require 'mysql2'

Bundler.require

require './app'
run Sinatra::Application