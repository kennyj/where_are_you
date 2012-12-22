# import cities from zip
City.import!

# load repo / contributors data from github api
["rails/rails",
 "jquery/jquery-mobile", "jquery/qunit", "jquery/jquery",
  "mrdoob/three.js",
  "rails/turbolinks", "rails/journey", "rails/arel",
  "rails/strong_parameters", "rails/exception_notification",
  "rails/coffee-rails", "rails/sass-rails", "rails/sprockets-rails",
  "rails/jquery-rails", "defunkt/jquery-pjax", "jnicklas/carrierwave",
  "intridea/omniauth", "pilu/web-app-theme", "LearnBoost/socket.io",
  "django/django", "nvie/gitflow", "ryanb/cancan",
  "github/gitignore", "defunkt/resque",
  "sinatra/sinatra", "antirez/redis", "documentcloud/underscore",
  "cucumber/cucumber", "Modernizr/Modernizr", "jashkenas/coffee-script",
  "symfony/symfony", "mislav/will_paginate", "justinfrench/formtastic",
  "documentcloud/backbone", "jquery/jquery-ui", "binarylogic/authlogic",
  "visionmedia/express", "thoughtbot/paperclip", "plataformatec/devise",
  "joshuaclayton/blueprint-css", "joyent/node"].each do |full_name|
  repo = Repository.create_or_update_from_api(full_name)
  repo.refresh_contributors_from_api
end

# Populate lng / lat from google map api.
Location.all.each { |l| l.coded!} 
