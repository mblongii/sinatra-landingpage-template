require 'rubygems'
require 'bundler/setup'

# Google Analytics: UNCOMMENT IF DESIRED, THEN ADD YOUR OWN ACCOUNT INFO HERE!
require 'rack/google-analytics'
use Rack::GoogleAnalytics, :tracker => ENV["ANALYTICS_ACCOUNT_ID"]


require './app'
run Sinatra::Application