## README


![Build Status](https://travis-ci.org/danhaywood/java-testsupport.png?branch=master)




1. Create super role.

     ⋅⋅⋅$ sudo su postgres -c psql
     ⋅⋅⋅postgres=# CREATE ROLE hotel_advisor SUPERUSER LOGIN;
     ⋅⋅⋅postgres=# \q

2. Prepare databases

     ⋅⋅⋅bundle exec rake db:create:all
     ⋅⋅⋅bundle exec rake db:migrate

3. Populate dev DB.

     ⋅⋅⋅bundle exec rake db:seed

4. Run server

     ⋅⋅⋅rails server -b 0.0.0.0 -p 3000 -e development

### RSPEC

     ⋅⋅⋅bundle exec rake db:test:prepare
     ⋅⋅⋅bundle exec rspec spec