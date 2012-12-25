where_are_you
=============
Getting started

1. git clone git://github.com/kennyj/where_are_you.git
2. cd where_are_you
3. Copy config/database.yml.example to config/database.yml. And edit config/database.yml.
4. Copy config/github.yml.example to config/github.yml. And edit config/github.yml.
   (your github account and password)
5. bundle update
6. RAILS_ENV=production bundle exec rake db:create
7. RAILS_ENV=production bundle exec rake db:migrate
8. Edit repository array in the db/seeds.rb.
   And RAILS_ENV=production bundle exec rake db:seed
9. RAILS_ENV=production bundle exec rake assets:precompile
10. Edit config/environments/production.rb
    config.serve_static_assets = true
11. RAILS_ENV=production bundle exec rails s
12. Browse http://yourhost:3000/

