Email Landing Page
============

A simple, customizable landing page for email signup, based on [Zurb](https://github.com/twitter/bootstrap), [HTML5 Boilerplate](https://github.com/h5bp/html5-boilerplate), and [Sinatra](https://github.com/sinatra/sinatra). Comes with Gaurd-Livereload to reload the browser (Install your browsers Live Reload plugin for this to work). To use, just run `$ foreman s -f Procfile.dev`

The current version has optional MailChimp and Google Analytics integration.

[Check Out the Demo](http://sinatra-email-landingpage.herokuapp.com/)

# Instructions

## The Setup
1. `$ git clone git@github.com:stoplion/sinatra-landingpage-template.git`
1. `$ cd sinatra-landingpage-template`
1. `$ rm -rf .git`
1. `$ bundle install`

1. Rename a file.env to .env
  1. Register for a free MailChimp account and generate an API key (required).
  1. Add your MAILCHIMP_LIST_NAME key to .env file (MAILCHIMP_LIST_NAME=xxxxx).
  1. Add your MAILCHIMP_LIST_NAME key to .env file (MAILCHIMP_LIST_NAME=xxxxx).
  1. Set up app.rb to capture the data you want, edit the form too.
  1. Add your Google Analytics account number to .env (ANALYTICS_ACCOUNT_ID=xxxxx)


## Remote and Local Deployment
1. `$ foreman s -f Procfile.dev` to start the app locally with Live Reload.

1. Register for a free Heroku account (optional).
  1. Follow the [Ruby instructions](https://devcenter.heroku.com/articles/ruby) to deploy to Heroku (optional).
  1. Make sure you [add the variables in .env to Heroku!](https://devcenter.heroku.com/articles/config-vars)


## Upcoming Features
1. Multiple deploy options
1. Different Template Options
1. Analytics