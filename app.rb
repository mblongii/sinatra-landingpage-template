require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

#Assets
require 'slim'
require 'sass'
require 'compass'
require "zurb-foundation"

#MailChimp
require 'hominid'




configure do
  set :slim, :pretty => true

  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end
  set :sass, Compass.sass_engine_options
  
  # In .env file:
  # Add a MAILCHIMP_API_KEY=your_api_key
  # Add a MAILCHIMP_LIST_NAME=your_list_name
  # Uncomment the below lines..
  # set :mailchimp_api_key, ENV["MAILCHIMP_API_KEY"]
  # set :mailchimp_list_name, ENV["MAILCHIMP_LIST_NAME"]
end


get "/stylesheets/app.css" do
  sass :"/stylesheets/app"
end


get '/' do
  slim :home
end


post '/signup' do
  email = params[:email]
  unless email.nil? || email.strip.empty?

    mailchimp = Hominid::API.new(settings.mailchimp_api_key)
    list_id = mailchimp.find_list_id_by_name(settings.mailchimp_list_name)
    raise "Unable to retrieve list id from MailChimp API." unless list_id

    # http://apidocs.mailchimp.com/api/rtfm/listsubscribe.func.php
    # double_optin, update_existing, replace_interests, send_welcome are all true by default (change as desired)
    mailchimp.list_subscribe(list_id, email, {}, 'html', true, true, true, true)

  end
  "Success."
end