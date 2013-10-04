Email Landing Page
============

A simple, customizable landing page for email signup, based on [Zurb](https://github.com/twitter/bootstrap), [HTML5 Boilerplate](https://github.com/h5bp/html5-boilerplate), and [Sinatra](https://github.com/sinatra/sinatra).

The current version has optional MailChimp and Google Analytics integration.


# Instructions

1. `$ git clone git@github.com:stoplion/sinatra-landingpage-template.git`
1. `$ cd sinatra-landingpage-template`
1. `$ rm -rf .git`
1. `$ bundle install`
1. create a .env file in the project root
1. Register for a free MailChimp account and generate an API key (required).
1. Add your MAILCHIMP_LIST_NAME key to .env file (MAILCHIMP_LIST_NAME=xxxxx).
1. Add your MAILCHIMP_LIST_NAME key to .env file (MAILCHIMP_LIST_NAME=xxxxx).
1. Add your Google Analytics account number to .env (ANALYTICS_ACCOUNT_ID=xxxxx)
1. `$ foreman start` to start the app locally on port 9292.
1. Test locally.
1. Register for a free Heroku account (optional).
1. Follow the [Ruby instructions](https://devcenter.heroku.com/articles/ruby) to deploy to Heroku (optional).
1. Configure [custom domain](https://devcenter.heroku.com/articles/custom-domains) name with Heroku.

