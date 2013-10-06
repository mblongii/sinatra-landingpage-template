#Base
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rack-flash'

#Assets
require 'slim'
require 'sass'
require 'compass'
require "zurb-foundation"

#MailChimp
require 'mailchimp'


configure do
  enable :sessions, :logging
  use Rack::Flash

  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :slim, :pretty => true
  set :sass, Compass.sass_engine_options

  # Set your list id and api key in .env
  set :mailchimp_api_key, ENV["MAILCHIMP_API_KEY"]
  set :mailchimp_list_id, ENV["MAILCHIMP_LIST_ID"]
end


get "/stylesheets/app.css" do
  sass :"/stylesheets/app"
end


get '/' do
  slim :home
end

get '/success' do
  slim :success
end

get '/error' do
  slim :error
end

post '/signup' do
  @chimp = Mailchimp::API.new(settings.mailchimp_api_key)

  # Setup whatever data you want to capture 
  email = params[:email]
  firstname = params[:firstname]
  lastname = params[:lastname]
  website = params[:website]
  lead_info = { FNAME: firstname, LNAME: lastname, MMERGE3: website }

  begin
    @chimp.lists.subscribe(settings.mailchimp_list_id, {email: email}, lead_info )
    flash[:notice] = "Thanks for signing up!"
    redirect :success
    return
  rescue Mailchimp::ListAlreadySubscribedError
    flash[:notice] = "#{email} is already subscribed to the list"
    redirect :error
    return
  rescue Mailchimp::ListDoesNotExistError
    flash[:notice] = "The list could not be found"
    redirect :error
    return
  rescue Mailchimp::Error
    flash[:notice] = "An unknwon error has occured"
    redirect :error
    return
  end
  
end