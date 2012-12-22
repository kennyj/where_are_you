where_are_you
=============
Getting started

1. git clone git://github.com/kennyj/where_are_you.git
2. cd where_are_you
3. bundle update
4. Copy config/database.yml.example to config/database.yml. And edit config/database.yml.
5. Copy config/github.yml.example to config/github.yml. And edit config/github.yml.
   (your github account and password)
6. RAILS_ENV=production bundle exec rake db:create db:migrate
7. RAILS_ENV=production bundle exec rake db:seeds
8. RAILS_ENV=production bundle exec rails s
9. Browse http://yourhost:3000/

