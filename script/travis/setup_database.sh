#!/bin/sh

psql -c 'create database hotel_advisor_test;' -U postgres
psql -c "CREATE USER hotel_advisor WITH PASSWORD '1234';" -U postgres
psql -c "GRANT ALL PRIVILEGES ON DATABASE hotel_advisor_test to hotel_advisor;" -U postgres
psql -U postgres -q -d hotel_advisor_test -f db/structure.sql

psql -c 'create database hotel_advisor_development;' -U postgres
psql -c "GRANT ALL PRIVILEGES ON DATABASE hotel_advisor_development to hotel_advisor;" -U postgres
psql -U postgres -q -d hotel_advisor_development -f db/structure.sql
